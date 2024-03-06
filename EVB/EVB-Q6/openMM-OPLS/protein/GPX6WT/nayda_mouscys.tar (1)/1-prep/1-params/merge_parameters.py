from Qpyl.core.qparameter import QPrm, QPrmError


parameters = QPrm('oplsaa')
parameters.read_prm('qoplsaa.prm')
parameters.read_prm('SNN.prm')


with open('qoplsaa_all.prm', 'w') as f:
    f.write(parameters.get_string())
    
