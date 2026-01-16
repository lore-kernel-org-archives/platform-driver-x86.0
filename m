Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317C43A641D;
	Fri, 16 Jan 2026 20:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596123; cv=none; b=lJiSJrO3ZzUzafM5R/++tgJrCTI/7+CWLOoygPD6MSLKoRPTAMYJi7v8fTJ8WO4ivdA1xsZCN86iDPCBXa5GEOpdrisuveenIDa/EE66rsIWWrEWvaFOqKwSgiQ4Y8orZszsk0o/jVHX8svihpvn1DOWNpOTGvzQ13/rhsVC7Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596123; c=relaxed/simple;
	bh=8MWKvLKrIhwESL6K2lYU1hcXZLjKr62HLpiR+lptuBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UlzTOKhONzs0jdaHlqxcnDpckXtmiDFlELicPPjRwUL1XeaJpax1ewVu7aR/zzE084WvZtdxZtiJWGlZymfU31yFByKXL5CI2VFYnbCh4qFt2tuWv/rWbFZRVC+cBkgPHnYw/cXOrtS/NdPdeW0MUnSvgde4WPo75SN0fuJru7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=aBu9qxsn; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="aBu9qxsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768596110; x=1769200910; i=w_armin@gmx.de;
	bh=WUXnniPV7qpv2Ba8+v4zPdnBdenui6dm7evYQTvUE04=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=aBu9qxsn5IjTtC7ya2WiLu/ryhPF7HdDfT62p74mDOONtcrBoyKPSIpyTDi5XHP3
	 UpYugPx+1p5gDFNO+uCqaCMbVV3MidX8jCccnrU95w9PX21RRKr+GGwcvD8g6m7Yd
	 ixdawc1WD1/xmxS9wa6W+kPtcMv31ybEr3hticaDhLtP15BjUFBeEVYo9Nq1E3rvU
	 Q5F7Q/KljYR2kTpU9m1jlAjYFJy18H10hZqNxncr8LiyFmC6SKq0EJQjHoK6U8z6+
	 vz+p3nuAMoMaEswwGHNdvVRg7BpoOw9C9qB+5vSWhXnv16HykpoC2ZzsuxVcGotkG
	 i4aXSj0feV3db4jbhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MNKhs-1vQzY732pG-00HtBN; Fri, 16 Jan 2026 21:41:49 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 9/9] platform/wmi: Update driver development guide
Date: Fri, 16 Jan 2026 21:41:16 +0100
Message-Id: <20260116204116.4030-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260116204116.4030-1-W_Armin@gmx.de>
References: <20260116204116.4030-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5wjcP1X1FAk2mc+M4yaDfBywVkchNoBYmgPtLLjTsMTeCSbzRbu
 cTWwBgNzWcyjDbfHi8XxnMror0zpjOIbGzZlJD0hLGRWZp9IC1wB/8jGkd+AuTUmwRIAwBJ
 8skanJv8dDTC2F+GI0lhVan5TZVJy9p8H5ME4NWo+/9UPNZF9i32TMzEG5qxffx9xM/D91U
 Xa0VP+kYtZ8Iq7KggNjxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:s1kxFnWhS5E=;MKg8QmCLqtvaeMuFZam3LkjFjw8
 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
 5g+mG5pBQXoameUQndewzoNb5OdiF

New WMI drivers should use the new buffer-based WMI API instead of
the deprecated ACPI-based API. Update the driver development guide
to recommend the buffer-based API to driver developers and explain
the purpose of struct wmi_buffer.

Also update the ACPI interface documentation to describe the
conversion rules for converting ACPI objects into WMI buffers.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/wmi/acpi-interface.rst          | 68 +++++++++++++++++
 .../wmi/driver-development-guide.rst          | 76 +++++++++++++------
 2 files changed, 121 insertions(+), 23 deletions(-)

diff --git a/Documentation/wmi/acpi-interface.rst b/Documentation/wmi/acpi=
-interface.rst
index 1ef003b033bf..4657101c528a 100644
=2D-- a/Documentation/wmi/acpi-interface.rst
+++ b/Documentation/wmi/acpi-interface.rst
@@ -104,3 +104,71 @@ holding the notification ID of the event. This method=
 should be evaluated every
 time an ACPI notification is received, since some ACPI implementations us=
e a
 queue to store WMI event data items. This queue will overflow after a cou=
ple
 of WMI events are received without retrieving the associated WMI event da=
ta.
+
+Conversion rules for ACPI data types
+------------------------------------
+
+Consumers of the ACPI-WMI interface use binary buffers to exchange data w=
ith the WMI driver core,
+with the internal structure of the buffer being only know to the consumer=
s. The WMI driver core is
+thus responsible for converting the data inside the buffer into an approp=
riate ACPI data type for
+consumption by the ACPI firmware. Additionally, any data returned by the =
various ACPI methods needs
+to be converted back into a binary buffer.
+
+The layout of said buffers is defined by the MOF description of the WMI m=
ethod or data block in
+question [1]_:
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
+Data Type       Layout                                                   =
               Alignment
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
+``string``      Starts with an unsigned 16-bit little endian integer spec=
ifying         2 bytes
+                the length of the string data in bytes, followed by the s=
tring data
+                encoded as UTF-16LE with **optional** NULL termination an=
d padding.
+                Keep in mind that some firmware implementations might dep=
end on the
+                terminating NULL character to be present. Also the paddin=
g should
+                always be performed with NULL characters.
+``boolean``     Single byte where 0 means ``false`` and nonzero means ``t=
rue``.         1 byte
+``sint8``       Signed 8-bit integer.                                    =
               1 byte
+``uint8``       Unsigned 8-bit integer.                                  =
               1 byte
+``sint16``      Signed 16-bit little endian integer.                     =
               2 bytes
+``uint16``      Unsigned 16-bit little endian integer.                   =
               2 bytes
+``sint32``      Signed 32-bit little endian integer.                     =
               4 bytes
+``uint32``      Unsigned 32-bit little endian integer.                   =
               4 bytes
+``sint64``      Signed 64-bit little endian integer.                     =
               8 bytes
+``uint64``      Unsigned 64-bit little endian integer.                   =
               8 bytes
+``datetime``    A fixed-length 25-character UTF-16LE string with the form=
at             2 bytes
+                *yyyymmddhhmmss.mmmmmmsutc* where *yyyy* is the 4-digit y=
ear, *mm* is
+                the 2-digit month, *dd* is the 2-digit day, *hh* is the 2=
-digit hour
+                based on a 24-hour clock, *mm* is the 2-digit minute, *ss=
* is the
+                2-digit second, *mmmmmm* is the 6-digit microsecond, *s* =
is a plus or
+                minus character depending on whether *utc* is a positive =
or negative
+                offset from UTC (or a colon if the date is an interval). =
Unpopulated
+                fields should be filled with asterisks.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Arrays should be aligned based on the alignment of their base type, while=
 objects should be
+aligned based on the largest alignment of an element inside them.
+
+All buffers returned by the WMI driver core are 8-byte aligned. When conv=
erting ACPI data types
+into such buffers the following conversion rules apply:
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+ACPI Data Type  Converted into
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+Buffer          Copied as-is.
+Integer         Converted into a ``uint32``.
+String          Converted into a ``string`` with a terminating NULL chara=
cter
+                to match the behavior the of the Windows driver.
+Package         Each element inside the package is converted with alignme=
nt
+                of the resulting data types being respected. Nested packa=
ges
+                are not allowed.
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+The Windows driver does attempt to handle nested packages, but this resul=
ts in internal data
+structures (``_ACPI_METHOD_ARGUMENT_V1``) erroneously being copied into t=
he resulting buffer.
+ACPI firmware implementations should thus not return nested packages from=
 ACPI methods
+associated with the ACPI-WMI interface.
+
+References
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+.. [1] https://learn.microsoft.com/en-us/windows-hardware/drivers/kernel/=
driver-defined-wmi-data-items
diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentatio=
n/wmi/driver-development-guide.rst
index 5680303ae314..fbc2d9b12fe9 100644
=2D-- a/Documentation/wmi/driver-development-guide.rst
+++ b/Documentation/wmi/driver-development-guide.rst
@@ -70,7 +70,7 @@ to matching WMI devices using a struct wmi_device_id tab=
le:
         .probe =3D foo_probe,
         .remove =3D foo_remove,         /* optional, devres is preferred =
*/
         .shutdown =3D foo_shutdown,     /* optional, called during shutdo=
wn */
-        .notify =3D foo_notify,         /* optional, for event handling *=
/
+        .notify_new =3D foo_notify,     /* optional, for event handling *=
/
         .no_notify_data =3D true,       /* optional, enables events conta=
ining no additional data */
         .no_singleton =3D true,         /* required for new WMI drivers *=
/
   };
@@ -90,9 +90,9 @@ the WMI device and put it in a well-known state for the =
WMI driver to pick up la
 or kexec. Most WMI drivers need no special shutdown handling and can thus=
 omit this callback.
=20
 Please note that new WMI drivers are required to be able to be instantiat=
ed multiple times,
-and are forbidden from using any deprecated GUID-based WMI functions. Thi=
s means that the
-WMI driver should be prepared for the scenario that multiple matching WMI=
 devices are present
-on a given machine.
+and are forbidden from using any deprecated GUID-based or ACPI-based WMI =
functions. This means
+that the WMI driver should be prepared for the scenario that multiple mat=
ching WMI devices are
+present on a given machine.
=20
 Because of this, WMI drivers should use the state container design patter=
n as described in
 Documentation/driver-api/driver-model/design-patterns.rst.
@@ -104,38 +104,37 @@ Documentation/driver-api/driver-model/design-pattern=
s.rst.
 WMI method drivers
 ------------------
=20
-WMI drivers can call WMI device methods using wmidev_evaluate_method(), t=
he
-structure of the ACPI buffer passed to this function is device-specific a=
nd usually
-needs some tinkering to get right. Looking at the ACPI tables containing =
the WMI
-device usually helps here. The method id and instance number passed to th=
is function
-are also device-specific, looking at the decoded Binary MOF is usually en=
ough to
-find the right values.
+WMI drivers can call WMI device methods using wmidev_invoke_method(). For=
 each WMI method
+invocation the WMI driver needs to provide the instance number and the me=
thod ID, as well as
+a buffer with the method arguments and optionally a buffer for the result=
s.
=20
-The maximum instance number can be retrieved during runtime using wmidev_=
instance_count().
+The layout of said buffers is device-specific and described by the Binary=
 MOF data associated
+with a given WMI device. Said Binary MOF data also describes the method I=
D of a given WMI method
+with the ``WmiMethodId`` qualifier. WMI devices exposing WMI methods usua=
lly expose only a single
+instance (instance number 0), but in theory can expose multiple instances=
 as well. In such a case
+the number of instances can be retrieved using wmidev_instance_count().
=20
-Take a look at drivers/platform/x86/inspur_platform_profile.c for an exam=
ple WMI method driver.
+Take a look at drivers/platform/x86/intel/wmi/thunderbolt.c for an exampl=
e WMI method driver.
=20
 WMI data block drivers
 ----------------------
=20
-WMI drivers can query WMI device data blocks using wmidev_block_query(), =
the
-structure of the returned ACPI object is again device-specific. Some WMI =
devices
-also allow for setting data blocks using wmidev_block_set().
+WMI drivers can query WMI data blocks using wmidev_query_block(), the lay=
out of the returned
+buffer is again device-specific and described by the Binary MOF data. Som=
e WMI data blocks are
+also writeable and can be set using wmidev_set_block(). The number of dat=
a block instances can
+again be retrieved using wmidev_instance_count().
=20
-The maximum instance number can also be retrieved using wmidev_instance_c=
ount().
-
-Take a look at drivers/platform/x86/intel/wmi/sbl-fw-update.c for an exam=
ple
-WMI data block driver.
+Take a look at drivers/platform/x86/intel/wmi/sbl-fw-update.c for an exam=
ple WMI data block driver.
=20
 WMI event drivers
 -----------------
=20
-WMI drivers can receive WMI events via the notify() callback inside the s=
truct wmi_driver.
+WMI drivers can receive WMI events via the notify_new() callback inside t=
he struct wmi_driver.
 The WMI subsystem will then take care of setting up the WMI event accordi=
ngly. Please note that
-the structure of the ACPI object passed to this callback is device-specif=
ic, and freeing the
-ACPI object is being done by the WMI subsystem, not the driver.
+the layout of the buffer passed to this callback is device-specific, and =
freeing of the buffer
+is done by the WMI subsystem itself, not the driver.
=20
-The WMI driver core will take care that the notify() callback will only b=
e called after
+The WMI driver core will take care that the notify_new() callback will on=
ly be called after
 the probe() callback has been called, and that no events are being receiv=
ed by the driver
 right before and after calling its remove() or shutdown() callback.
=20
@@ -147,6 +146,36 @@ the ``no_notify_data`` flag inside struct wmi_driver =
should be set to ``true``.
=20
 Take a look at drivers/platform/x86/xiaomi-wmi.c for an example WMI event=
 driver.
=20
+Exchanging data with the WMI driver core
+----------------------------------------
+
+WMI drivers can exchange data with the WMI driver core using struct wmi_b=
uffer. The internal
+structure of those buffers is device-specific and only known by the WMI d=
river. Because of this
+the WMI driver itself is responsible for parsing and validating the data =
received from its
+WMI device.
+
+The structure of said buffers is described by the MOF data associated wit=
h the WMI device in
+question. When such a buffer contains multiple data items it usually make=
s sense to define a
+C structure and use it during parsing. Since the WMI driver core guarante=
es that all buffers
+received from a WMI device are aligned on an 8-byte boundary, WMI drivers=
 can simply perform
+a cast between the WMI buffer data and this C structure.
+
+This however should only be done after the size of the buffer was verifie=
d to be large enough
+to hold the whole C structure. WMI drivers should reject undersized buffe=
rs as they are usually
+sent by the WMI device to signal an internal error. Oversized buffers how=
ever should be accepted
+to emulate the behavior of the Windows WMI implementation.
+
+When defining a C structure for parsing WMI buffers the alignment of the =
data items should be
+respected. This is especially important for 64-bit integers as those have=
 different alignments
+on 64-bit (8-byte alignment) and 32-bit (4-byte alignment) architectures.=
 It is thus a good idea
+to manually specify the alignment of such data items or mark the whole st=
ructure as packed when
+appropriate. Integer data items in general are little-endian integers and=
 should be marked as
+such using ``__le64`` and friends. When parsing WMI string data items the=
 struct wmi_string should
+be used as WMI strings have a different layout than C strings.
+
+See Documentation/wmi/acpi-interface.rst for more information regarding t=
he binary format
+of WMI data items.
+
 Handling multiple WMI devices at once
 -------------------------------------
=20
@@ -171,6 +200,7 @@ Things to avoid
 When developing WMI drivers, there are a couple of things which should be=
 avoided:
=20
 - usage of the deprecated GUID-based WMI interface which uses GUIDs inste=
ad of WMI device structs
+- usage of the deprecated ACPI-based WMI interface which uses ACPI object=
s instead of plain buffers
 - bypassing of the WMI subsystem when talking to WMI devices
 - WMI drivers which cannot be instantiated multiple times.
=20
=2D-=20
2.39.5

