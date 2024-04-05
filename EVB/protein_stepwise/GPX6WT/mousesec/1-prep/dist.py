from pymol import cmd

# Define a function to export distances to a file
def export_distances(filename):
    with open(filename, 'w') as f:
        # Define atom selections
        atom1 = "GLN`83/OE1"
        atom2 = "PRX`196/H1"

        # Calculate distance for each frame
        for frame in range(1, cmd.count_states() + 1):
            # Set the frame
            cmd.frame(frame)
            # Calculate distance
            distance_value = cmd.distance(atom1, atom2)
            # Write distance information to file
            f.write(f'Frame {frame}: Distance between {atom1} and {atom2}: {distance_value}\n')

# Call the function to export distances to a file
export_distances('distances.txt')