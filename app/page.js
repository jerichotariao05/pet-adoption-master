export default function Home() {
  const adoptionData = [
    {
      "adopter_id": 1,
      "pet_id": 201,
      "request_status": "qualified",
      "review_completed_at": "2024-10-01 10:00:00",
      "interview_status": "pending",
      "interview_scheduled_at": "2024-10-25 14:00:00",
      "adoption_status": "in_process",
      "adoption_date": null,
      "current_phase": "interview"
    },
    {
      "adopter_id": 2,
      "pet_id": 202,
      "request_status": "pending_review",
      "review_completed_at": null,
      "interview_status": null,
      "adoption_status": null,
      "adoption_date": null,
      "current_phase": "review"
    },
    {
      "adopter_id": 3,
      "pet_id": 203,
      "request_status": "qualified",
      "review_completed_at": "2024-10-05 12:00:00",
      "interview_status": "passed",
      "interview_scheduled_at": "2024-10-12 10:00:00",
      "adoption_status": "successful",
      "adoption_date": "2024-10-19 09:00:00",
      "current_phase": "adoption_finalized"
    },
    {
      "adopter_id": 4,
      "pet_id": 204,
      "request_status": "unqualified",
      "review_completed_at": "2024-10-02 11:00:00",
      "interview_status": "failed",
      "interview_scheduled_at": "2024-10-10 15:00:00",
      "adoption_status": null,
      "adoption_date": null,
      "current_phase": "interview"
    },
    {
      "adopter_id": 5,
      "pet_id": 205,
      "request_status": "pending_review",
      "review_completed_at": null,
      "interview_status": null,
      "adoption_status": null,
      "adoption_date": null,
      "current_phase": "review"
    },
    {
      "adopter_id": 6,
      "pet_id": 206,
      "request_status": "qualified",
      "review_completed_at": "2024-10-03 09:30:00",
      "interview_status": "no_show",
      "interview_scheduled_at": "2024-10-15 11:00:00",
      "adoption_status": null,
      "adoption_date": null,
      "current_phase": "interview"
    },
    {
      "adopter_id": 7,
      "pet_id": 207,
      "request_status": "unqualified", 
      "review_completed_at": "2024-10-08 13:00:00",
      "interview_status": null, // No interview since the request is rejected early
      "interview_scheduled_at": null,
      "adoption_status": null, // No further adoption process
      "adoption_date": null,
      "current_phase": "review" // The request was rejected during the review phase
    }
  ];
  
  

  const phaseMapping = {
    review: 1,
    qualified: 2,
    unqualified: 2,
    interview: 3,
    passed: 3,
    failed: 3,
    no_show: 3,
    adoption_finalized: 4,
    cancelled: 5,
  };

  const phaseLabels = [
    { name: 'Adoption Request', key: 'request_status', completedKey: 'review_completed_at' },
    { name: 'Interview Phase', key: 'interview_status', completedKey: 'interview_scheduled_at' },
    { name: 'Adoption Finalized', key: 'adoption_date', completedKey: 'adoption_date' },
    { name: 'Cancelled', key: null, completedKey: null },
  ];

  return (
    <div className="container mx-auto p-8">
      <h1 className="text-3xl font-bold mb-8">Pet Adoption Tracker</h1>
      <div className="space-y-8">
      {adoptionData.map((item, idx) => {
        const phaseIndex = phaseMapping[item.current_phase];

        return (
          <div key={idx} className="p-4 bg-white shadow-lg rounded-lg">
            <h2 className="text-xl font-semibold mb-4">Adoption Process for Adopter ID: {item.adopter_id}</h2>
            <div className="relative">
              <div className="flex flex-col relative z-10">
                {/* Request Approval Phase */}
                <div className="flex items-start relative">
                  <div className="flex flex-col items-center">
                    <div
                      className={`w-6 h-6 rounded-full flex items-center justify-center z-10 relative ${
                        phaseIndex >= 1 ? 'bg-green-500' : 'bg-gray-300'
                      }`}
                    >
                      {phaseIndex >= 1 ? '✓' : ''}
                    </div>

                    {/* Single vertical line */}
                    {phaseIndex >= 1 && (
                      <div
                        className={`w-1 h-12 ${
                          phaseIndex >= 1 ? 'bg-green-500' : 'bg-gray-300'
                        }`}
                      ></div>
                    )}
                  </div>

                  {/* Phase Label and Request Status */}
                  <div className="ml-6">
                    <p className="font-medium">{phaseLabels[0].name}</p>
                    <p className="text-sm text-gray-500">
                      Status: {item.request_status || 'Under Review'}
                    </p>
                    {item.review_completed_at && (
                      <p className="text-xs text-gray-400">Completed at: {item.review_completed_at}</p>
                    )}
                  </div>
                </div>

                {/* Interview Phase */}
                <div className="flex items-start relative">
                  <div className="flex flex-col items-center">
                    <div
                      className={`w-6 h-6 rounded-full flex items-center justify-center z-10 relative ${
                        phaseIndex >= 2 ? 'bg-green-500' : 'bg-gray-300'
                      }`}
                    >
                      {phaseIndex >= 2 ? '✓' : ''}
                    </div>

                    {/* Single vertical line */}
                    {phaseIndex >= 2 && (
                      <div
                        className={`w-1 h-12 ${
                          phaseIndex >= 2 ? 'bg-green-500' : 'bg-gray-300'
                        }`}
                      ></div>
                    )}
                  </div>

                  {/* Phase Label and Interview Status */}
                  <div className="ml-6">
                    <p className="font-medium">{phaseLabels[1].name}</p>
                    <p className="text-sm text-gray-500">
                      Status: {item.interview_status || 'Pending'}
                    </p>
                    {item.interview_scheduled_at && (
                      <p className="text-xs text-gray-400">Scheduled at: {item.interview_scheduled_at}</p>
                    )}
                  </div>
                </div>

                {/* Adoption Finalized Phase */}
                {item.adoption_date && (
                  <div className="flex items-start relative">
                    <div className="flex flex-col items-center">
                      <div
                        className={`w-6 h-6 rounded-full flex items-center justify-center z-10 relative ${
                          phaseIndex >= 3 ? 'bg-green-500' : 'bg-gray-300'
                        }`}
                      >
                        {phaseIndex >= 3 ? '✓' : ''}
                      </div>

                      {/* Single vertical line */}
                      {phaseIndex >= 3 && !item.adoption_date && (
                        <div
                          className={`w-1 h-12 ${
                            phaseIndex >= 3 ? 'bg-green-500' : 'bg-gray-300'
                          }`}
                        ></div>
                      )}
                    </div>

                    {/* Phase Label and Adoption Date */}
                    <div className="ml-6">
                      <p className="font-medium">{phaseLabels[2].name}</p>
                      <p className="text-sm text-gray-500">Completed at: {item.adoption_date}</p>
                    </div>
                  </div>
                )}

                {/* Cancelled Phase */}
                {item.current_phase === 'cancelled' && (
                  <div className="flex items-start relative">
                    <div className="flex flex-col items-center">
                      <div
                        className={`w-6 h-6 rounded-full flex items-center justify-center z-10 relative bg-gray-300`}
                      >
                        ✖️
                      </div>
                    </div>

                    {/* Phase Label */}
                    <div className="ml-6">
                      <p className="font-medium">{phaseLabels[3].name}</p>
                      <p className="text-sm text-gray-500">Status: Cancelled</p>
                    </div>
                  </div>
                )}
              </div>
            </div>
          </div>
        );
      })}
    </div>
    </div>
  );
}
