// Copyright (c) 2022 Timofey Solomko
// Licensed under MIT License
//
// See LICENSE for license information

import Foundation

extension Deflate {
    enum Constants {
        // Precomputed codes for the static Huffman literal and distance trees.
        static let staticHuffmanLiteralCodes =
            [Code(bits: 7, code: 0, symbol: 256), Code(bits: 7, code: 64, symbol: 257),
             Code(bits: 7, code: 32, symbol: 258), Code(bits: 7, code: 96, symbol: 259),
             Code(bits: 7, code: 16, symbol: 260), Code(bits: 7, code: 80, symbol: 261),
             Code(bits: 7, code: 48, symbol: 262), Code(bits: 7, code: 112, symbol: 263),
             Code(bits: 7, code: 8, symbol: 264), Code(bits: 7, code: 72, symbol: 265),
             Code(bits: 7, code: 40, symbol: 266), Code(bits: 7, code: 104, symbol: 267),
             Code(bits: 7, code: 24, symbol: 268), Code(bits: 7, code: 88, symbol: 269),
             Code(bits: 7, code: 56, symbol: 270), Code(bits: 7, code: 120, symbol: 271),
             Code(bits: 7, code: 4, symbol: 272), Code(bits: 7, code: 68, symbol: 273),
             Code(bits: 7, code: 36, symbol: 274), Code(bits: 7, code: 100, symbol: 275),
             Code(bits: 7, code: 20, symbol: 276), Code(bits: 7, code: 84, symbol: 277),
             Code(bits: 7, code: 52, symbol: 278), Code(bits: 7, code: 116, symbol: 279),
             Code(bits: 8, code: 12, symbol: 0), Code(bits: 8, code: 140, symbol: 1),
             Code(bits: 8, code: 76, symbol: 2), Code(bits: 8, code: 204, symbol: 3),
             Code(bits: 8, code: 44, symbol: 4), Code(bits: 8, code: 172, symbol: 5),
             Code(bits: 8, code: 108, symbol: 6), Code(bits: 8, code: 236, symbol: 7),
             Code(bits: 8, code: 28, symbol: 8), Code(bits: 8, code: 156, symbol: 9),
             Code(bits: 8, code: 92, symbol: 10), Code(bits: 8, code: 220, symbol: 11),
             Code(bits: 8, code: 60, symbol: 12), Code(bits: 8, code: 188, symbol: 13),
             Code(bits: 8, code: 124, symbol: 14), Code(bits: 8, code: 252, symbol: 15),
             Code(bits: 8, code: 2, symbol: 16), Code(bits: 8, code: 130, symbol: 17),
             Code(bits: 8, code: 66, symbol: 18), Code(bits: 8, code: 194, symbol: 19),
             Code(bits: 8, code: 34, symbol: 20), Code(bits: 8, code: 162, symbol: 21),
             Code(bits: 8, code: 98, symbol: 22), Code(bits: 8, code: 226, symbol: 23),
             Code(bits: 8, code: 18, symbol: 24), Code(bits: 8, code: 146, symbol: 25),
             Code(bits: 8, code: 82, symbol: 26), Code(bits: 8, code: 210, symbol: 27),
             Code(bits: 8, code: 50, symbol: 28), Code(bits: 8, code: 178, symbol: 29),
             Code(bits: 8, code: 114, symbol: 30), Code(bits: 8, code: 242, symbol: 31),
             Code(bits: 8, code: 10, symbol: 32), Code(bits: 8, code: 138, symbol: 33),
             Code(bits: 8, code: 74, symbol: 34), Code(bits: 8, code: 202, symbol: 35),
             Code(bits: 8, code: 42, symbol: 36), Code(bits: 8, code: 170, symbol: 37),
             Code(bits: 8, code: 106, symbol: 38), Code(bits: 8, code: 234, symbol: 39),
             Code(bits: 8, code: 26, symbol: 40), Code(bits: 8, code: 154, symbol: 41),
             Code(bits: 8, code: 90, symbol: 42), Code(bits: 8, code: 218, symbol: 43),
             Code(bits: 8, code: 58, symbol: 44), Code(bits: 8, code: 186, symbol: 45),
             Code(bits: 8, code: 122, symbol: 46), Code(bits: 8, code: 250, symbol: 47),
             Code(bits: 8, code: 6, symbol: 48), Code(bits: 8, code: 134, symbol: 49),
             Code(bits: 8, code: 70, symbol: 50), Code(bits: 8, code: 198, symbol: 51),
             Code(bits: 8, code: 38, symbol: 52), Code(bits: 8, code: 166, symbol: 53),
             Code(bits: 8, code: 102, symbol: 54), Code(bits: 8, code: 230, symbol: 55),
             Code(bits: 8, code: 22, symbol: 56), Code(bits: 8, code: 150, symbol: 57),
             Code(bits: 8, code: 86, symbol: 58), Code(bits: 8, code: 214, symbol: 59),
             Code(bits: 8, code: 54, symbol: 60), Code(bits: 8, code: 182, symbol: 61),
             Code(bits: 8, code: 118, symbol: 62), Code(bits: 8, code: 246, symbol: 63),
             Code(bits: 8, code: 14, symbol: 64), Code(bits: 8, code: 142, symbol: 65),
             Code(bits: 8, code: 78, symbol: 66), Code(bits: 8, code: 206, symbol: 67),
             Code(bits: 8, code: 46, symbol: 68), Code(bits: 8, code: 174, symbol: 69),
             Code(bits: 8, code: 110, symbol: 70), Code(bits: 8, code: 238, symbol: 71),
             Code(bits: 8, code: 30, symbol: 72), Code(bits: 8, code: 158, symbol: 73),
             Code(bits: 8, code: 94, symbol: 74), Code(bits: 8, code: 222, symbol: 75),
             Code(bits: 8, code: 62, symbol: 76), Code(bits: 8, code: 190, symbol: 77),
             Code(bits: 8, code: 126, symbol: 78), Code(bits: 8, code: 254, symbol: 79),
             Code(bits: 8, code: 1, symbol: 80), Code(bits: 8, code: 129, symbol: 81),
             Code(bits: 8, code: 65, symbol: 82), Code(bits: 8, code: 193, symbol: 83),
             Code(bits: 8, code: 33, symbol: 84), Code(bits: 8, code: 161, symbol: 85),
             Code(bits: 8, code: 97, symbol: 86), Code(bits: 8, code: 225, symbol: 87),
             Code(bits: 8, code: 17, symbol: 88), Code(bits: 8, code: 145, symbol: 89),
             Code(bits: 8, code: 81, symbol: 90), Code(bits: 8, code: 209, symbol: 91),
             Code(bits: 8, code: 49, symbol: 92), Code(bits: 8, code: 177, symbol: 93),
             Code(bits: 8, code: 113, symbol: 94), Code(bits: 8, code: 241, symbol: 95),
             Code(bits: 8, code: 9, symbol: 96), Code(bits: 8, code: 137, symbol: 97),
             Code(bits: 8, code: 73, symbol: 98), Code(bits: 8, code: 201, symbol: 99),
             Code(bits: 8, code: 41, symbol: 100), Code(bits: 8, code: 169, symbol: 101),
             Code(bits: 8, code: 105, symbol: 102), Code(bits: 8, code: 233, symbol: 103),
             Code(bits: 8, code: 25, symbol: 104), Code(bits: 8, code: 153, symbol: 105),
             Code(bits: 8, code: 89, symbol: 106), Code(bits: 8, code: 217, symbol: 107),
             Code(bits: 8, code: 57, symbol: 108), Code(bits: 8, code: 185, symbol: 109),
             Code(bits: 8, code: 121, symbol: 110), Code(bits: 8, code: 249, symbol: 111),
             Code(bits: 8, code: 5, symbol: 112), Code(bits: 8, code: 133, symbol: 113),
             Code(bits: 8, code: 69, symbol: 114), Code(bits: 8, code: 197, symbol: 115),
             Code(bits: 8, code: 37, symbol: 116), Code(bits: 8, code: 165, symbol: 117),
             Code(bits: 8, code: 101, symbol: 118), Code(bits: 8, code: 229, symbol: 119),
             Code(bits: 8, code: 21, symbol: 120), Code(bits: 8, code: 149, symbol: 121),
             Code(bits: 8, code: 85, symbol: 122), Code(bits: 8, code: 213, symbol: 123),
             Code(bits: 8, code: 53, symbol: 124), Code(bits: 8, code: 181, symbol: 125),
             Code(bits: 8, code: 117, symbol: 126), Code(bits: 8, code: 245, symbol: 127),
             Code(bits: 8, code: 13, symbol: 128), Code(bits: 8, code: 141, symbol: 129),
             Code(bits: 8, code: 77, symbol: 130), Code(bits: 8, code: 205, symbol: 131),
             Code(bits: 8, code: 45, symbol: 132), Code(bits: 8, code: 173, symbol: 133),
             Code(bits: 8, code: 109, symbol: 134), Code(bits: 8, code: 237, symbol: 135),
             Code(bits: 8, code: 29, symbol: 136), Code(bits: 8, code: 157, symbol: 137),
             Code(bits: 8, code: 93, symbol: 138), Code(bits: 8, code: 221, symbol: 139),
             Code(bits: 8, code: 61, symbol: 140), Code(bits: 8, code: 189, symbol: 141),
             Code(bits: 8, code: 125, symbol: 142), Code(bits: 8, code: 253, symbol: 143),
             Code(bits: 8, code: 3, symbol: 280), Code(bits: 8, code: 131, symbol: 281),
             Code(bits: 8, code: 67, symbol: 282), Code(bits: 8, code: 195, symbol: 283),
             Code(bits: 8, code: 35, symbol: 284), Code(bits: 8, code: 163, symbol: 285),
             Code(bits: 8, code: 99, symbol: 286), Code(bits: 8, code: 227, symbol: 287),
             Code(bits: 9, code: 19, symbol: 144), Code(bits: 9, code: 275, symbol: 145),
             Code(bits: 9, code: 147, symbol: 146), Code(bits: 9, code: 403, symbol: 147),
             Code(bits: 9, code: 83, symbol: 148), Code(bits: 9, code: 339, symbol: 149),
             Code(bits: 9, code: 211, symbol: 150), Code(bits: 9, code: 467, symbol: 151),
             Code(bits: 9, code: 51, symbol: 152), Code(bits: 9, code: 307, symbol: 153),
             Code(bits: 9, code: 179, symbol: 154), Code(bits: 9, code: 435, symbol: 155),
             Code(bits: 9, code: 115, symbol: 156), Code(bits: 9, code: 371, symbol: 157),
             Code(bits: 9, code: 243, symbol: 158), Code(bits: 9, code: 499, symbol: 159),
             Code(bits: 9, code: 11, symbol: 160), Code(bits: 9, code: 267, symbol: 161),
             Code(bits: 9, code: 139, symbol: 162), Code(bits: 9, code: 395, symbol: 163),
             Code(bits: 9, code: 75, symbol: 164), Code(bits: 9, code: 331, symbol: 165),
             Code(bits: 9, code: 203, symbol: 166), Code(bits: 9, code: 459, symbol: 167),
             Code(bits: 9, code: 43, symbol: 168), Code(bits: 9, code: 299, symbol: 169),
             Code(bits: 9, code: 171, symbol: 170), Code(bits: 9, code: 427, symbol: 171),
             Code(bits: 9, code: 107, symbol: 172), Code(bits: 9, code: 363, symbol: 173),
             Code(bits: 9, code: 235, symbol: 174), Code(bits: 9, code: 491, symbol: 175),
             Code(bits: 9, code: 27, symbol: 176), Code(bits: 9, code: 283, symbol: 177),
             Code(bits: 9, code: 155, symbol: 178), Code(bits: 9, code: 411, symbol: 179),
             Code(bits: 9, code: 91, symbol: 180), Code(bits: 9, code: 347, symbol: 181),
             Code(bits: 9, code: 219, symbol: 182), Code(bits: 9, code: 475, symbol: 183),
             Code(bits: 9, code: 59, symbol: 184), Code(bits: 9, code: 315, symbol: 185),
             Code(bits: 9, code: 187, symbol: 186), Code(bits: 9, code: 443, symbol: 187),
             Code(bits: 9, code: 123, symbol: 188), Code(bits: 9, code: 379, symbol: 189),
             Code(bits: 9, code: 251, symbol: 190), Code(bits: 9, code: 507, symbol: 191),
             Code(bits: 9, code: 7, symbol: 192), Code(bits: 9, code: 263, symbol: 193),
             Code(bits: 9, code: 135, symbol: 194), Code(bits: 9, code: 391, symbol: 195),
             Code(bits: 9, code: 71, symbol: 196), Code(bits: 9, code: 327, symbol: 197),
             Code(bits: 9, code: 199, symbol: 198), Code(bits: 9, code: 455, symbol: 199),
             Code(bits: 9, code: 39, symbol: 200), Code(bits: 9, code: 295, symbol: 201),
             Code(bits: 9, code: 167, symbol: 202), Code(bits: 9, code: 423, symbol: 203),
             Code(bits: 9, code: 103, symbol: 204), Code(bits: 9, code: 359, symbol: 205),
             Code(bits: 9, code: 231, symbol: 206), Code(bits: 9, code: 487, symbol: 207),
             Code(bits: 9, code: 23, symbol: 208), Code(bits: 9, code: 279, symbol: 209),
             Code(bits: 9, code: 151, symbol: 210), Code(bits: 9, code: 407, symbol: 211),
             Code(bits: 9, code: 87, symbol: 212), Code(bits: 9, code: 343, symbol: 213),
             Code(bits: 9, code: 215, symbol: 214), Code(bits: 9, code: 471, symbol: 215),
             Code(bits: 9, code: 55, symbol: 216), Code(bits: 9, code: 311, symbol: 217),
             Code(bits: 9, code: 183, symbol: 218), Code(bits: 9, code: 439, symbol: 219),
             Code(bits: 9, code: 119, symbol: 220), Code(bits: 9, code: 375, symbol: 221),
             Code(bits: 9, code: 247, symbol: 222), Code(bits: 9, code: 503, symbol: 223),
             Code(bits: 9, code: 15, symbol: 224), Code(bits: 9, code: 271, symbol: 225),
             Code(bits: 9, code: 143, symbol: 226), Code(bits: 9, code: 399, symbol: 227),
             Code(bits: 9, code: 79, symbol: 228), Code(bits: 9, code: 335, symbol: 229),
             Code(bits: 9, code: 207, symbol: 230), Code(bits: 9, code: 463, symbol: 231),
             Code(bits: 9, code: 47, symbol: 232), Code(bits: 9, code: 303, symbol: 233),
             Code(bits: 9, code: 175, symbol: 234), Code(bits: 9, code: 431, symbol: 235),
             Code(bits: 9, code: 111, symbol: 236), Code(bits: 9, code: 367, symbol: 237),
             Code(bits: 9, code: 239, symbol: 238), Code(bits: 9, code: 495, symbol: 239),
             Code(bits: 9, code: 31, symbol: 240), Code(bits: 9, code: 287, symbol: 241),
             Code(bits: 9, code: 159, symbol: 242), Code(bits: 9, code: 415, symbol: 243),
             Code(bits: 9, code: 95, symbol: 244), Code(bits: 9, code: 351, symbol: 245),
             Code(bits: 9, code: 223, symbol: 246), Code(bits: 9, code: 479, symbol: 247),
             Code(bits: 9, code: 63, symbol: 248), Code(bits: 9, code: 319, symbol: 249),
             Code(bits: 9, code: 191, symbol: 250), Code(bits: 9, code: 447, symbol: 251),
             Code(bits: 9, code: 127, symbol: 252), Code(bits: 9, code: 383, symbol: 253),
             Code(bits: 9, code: 255, symbol: 254), Code(bits: 9, code: 511, symbol: 255)]

        static let staticHuffmanDistanceCodes =
            [Code(bits: 5, code: 0, symbol: 0), Code(bits: 5, code: 16, symbol: 1),
             Code(bits: 5, code: 8, symbol: 2), Code(bits: 5, code: 24, symbol: 3),
             Code(bits: 5, code: 4, symbol: 4), Code(bits: 5, code: 20, symbol: 5),
             Code(bits: 5, code: 12, symbol: 6), Code(bits: 5, code: 28, symbol: 7),
             Code(bits: 5, code: 2, symbol: 8), Code(bits: 5, code: 18, symbol: 9),
             Code(bits: 5, code: 10, symbol: 10), Code(bits: 5, code: 26, symbol: 11),
             Code(bits: 5, code: 6, symbol: 12), Code(bits: 5, code: 22, symbol: 13),
             Code(bits: 5, code: 14, symbol: 14), Code(bits: 5, code: 30, symbol: 15),
             Code(bits: 5, code: 1, symbol: 16), Code(bits: 5, code: 17, symbol: 17),
             Code(bits: 5, code: 9, symbol: 18), Code(bits: 5, code: 25, symbol: 19),
             Code(bits: 5, code: 5, symbol: 20), Code(bits: 5, code: 21, symbol: 21),
             Code(bits: 5, code: 13, symbol: 22), Code(bits: 5, code: 29, symbol: 23),
             Code(bits: 5, code: 3, symbol: 24), Code(bits: 5, code: 19, symbol: 25),
             Code(bits: 5, code: 11, symbol: 26), Code(bits: 5, code: 27, symbol: 27),
             Code(bits: 5, code: 7, symbol: 28), Code(bits: 5, code: 23, symbol: 29),
             Code(bits: 5, code: 15, symbol: 30), Code(bits: 5, code: 31, symbol: 31)]

        static let codeLengthOrders: [Int] =
            [16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15]

        /// - Warning: Substract 257 from index!
        static let lengthBase: [Int] =
            [3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 17, 19, 23, 27, 31, 35,
             43, 51, 59, 67, 83, 99, 115, 131, 163, 195, 227, 258]

        static let distanceBase: [Int] =
            [1, 2, 3, 4, 5, 7, 9, 13, 17, 25, 33, 49, 65, 97, 129, 193,
             257, 385, 513, 769, 1025, 1537, 2049, 3073, 4097, 6145,
             8193, 12289, 16385, 24577]

        static let lengthCode: [Int] =
            [257, 258, 259, 260, 261, 262, 263, 264, 265, 265, 266, 266, 267, 267, 268, 268,
             269, 269, 269, 269, 270, 270, 270, 270, 271, 271, 271, 271, 272, 272, 272, 272,
             273, 273, 273, 273, 273, 273, 273, 273, 274, 274, 274, 274, 274, 274, 274, 274,
             275, 275, 275, 275, 275, 275, 275, 275, 276, 276, 276, 276, 276, 276, 276, 276,
             277, 277, 277, 277, 277, 277, 277, 277, 277, 277, 277, 277, 277, 277, 277, 277,
             278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278, 278,
             279, 279, 279, 279, 279, 279, 279, 279, 279, 279, 279, 279, 279, 279, 279, 279,
             280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280, 280,
             281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281,
             281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281, 281,
             282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282,
             282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282, 282,
             283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283,
             283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283, 283,
             284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284,
             284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 284, 285]
    }
}
