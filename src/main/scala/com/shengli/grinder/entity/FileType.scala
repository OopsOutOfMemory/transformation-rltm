package com.shengli.grinder.entity

abstract class FileType 

class HDFSFileType extends FileType
class LocalFileType extends FileType

case class SeqLzoHDFSFile extends HDFSFileType
case class TextHDFSFile extends HDFSFileType






