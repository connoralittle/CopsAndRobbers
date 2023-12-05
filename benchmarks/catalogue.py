import os

graphs = [
('d_highly_0.pddl', 'p_highly_0.pddl',),
('d_highly_1.pddl', 'p_highly_1.pddl',),
('d_highly_2.pddl', 'p_highly_2.pddl',),
('d_highly_3.pddl', 'p_highly_3.pddl',),
('d_highly_4.pddl', 'p_highly_4.pddl',),
('d_highly_5.pddl', 'p_highly_5.pddl',),
('d_highly_6.pddl', 'p_highly_6.pddl',),
('d_highly_7.pddl', 'p_highly_7.pddl',),
('d_highly_8.pddl', 'p_highly_8.pddl',),
('d_highly_9.pddl', 'p_highly_9.pddl',),
('d_highly_10.pddl', 'p_highly_10.pddl',),
('d_highly_11.pddl', 'p_highly_11.pddl',),
('d_highly_12.pddl', 'p_highly_12.pddl',),
('d_highly_13.pddl', 'p_highly_13.pddl',),
('d_highly_14.pddl', 'p_highly_14.pddl',),
('d_highly_15.pddl', 'p_highly_15.pddl',),
('d_highly_16.pddl', 'p_highly_16.pddl',),
('d_highly_17.pddl', 'p_highly_17.pddl',),
('d_highly_18.pddl', 'p_highly_18.pddl',),
('d_highly_19.pddl', 'p_highly_19.pddl',),
('d_highly_20.pddl', 'p_highly_20.pddl',),
]
DOMAINS = {
                'highly': graphs,
            }
COLLECTIONS = {
                'collection': ['highly',]
            }
    # Path to the directory containing this script
SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))

for dom in DOMAINS:
    # Replace all the files with their absolute path
    DOMAINS[dom] = [
        (os.path.abspath(os.path.join(SCRIPT_DIR, dom, dom_file)), os.path.abspath(os.path.join(SCRIPT_DIR, dom, prob_file))) for dom_file, prob_file in DOMAINS[dom]
    ]

def confirm_files():
    for d in DOMAINS:
        print('(%3d) %s' % (len(DOMAINS[d]), d))
        for domain, problem in DOMAINS[d]:
            assert os.path.exists(domain), f'{domain} does not exist'
            assert os.path.exists(problem), f'{problem} does not exist'