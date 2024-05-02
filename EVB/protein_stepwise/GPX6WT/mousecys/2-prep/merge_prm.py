from Qpyl.core.qparameter import QPrm, QPrmError


parameters = QPrm('oplsaa')
parameters.read_prm('qoplsaa.prm')
parameters.read_prm('SNN.prm')
parameters.read_prm('SEC.prm')
parameters.read_prm('SEN.prm')
parameters.read_prm('SNN.prm')
parameters.read_prm('SUL.prm')
parameters.read_prm('GLNP.prm')
parameters.read_prm('SEL.prm')
parameters.read_prm('PRX.prm')

with open('qoplsaa_all.prm', 'w') as f:
    f.write(parameters.get_string())




