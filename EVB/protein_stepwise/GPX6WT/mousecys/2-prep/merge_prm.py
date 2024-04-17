from Qpyl.core.qparameter import QPrm, QPrmError


parameters = QPrm('oplsaa')
parameters.read_prm('qoplsaa_all.prm')
parameters.read_prm('HO2.prm')


with open('qoplsaa.prm', 'w') as f:
    f.write(parameters.get_string())
