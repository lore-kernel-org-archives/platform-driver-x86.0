Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBAB3148A7;
	Sat, 20 Dec 2025 20:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766263646; cv=none; b=tY/5GEiIUopCLu1UFv7hse76nIIRE4F/9d5viV1ZyDk5j5MO+IXe5KqslIVZhglaDPGh2Xyz2IXGiOQOGK3tnp1N5cTjZ+Uo7DJIVXp0qUUM+A35fV70zh2YbTAKmlojrmX0UL3PMxcp5s4Xwv6Eye02cptzMW+37oHUNDni9M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766263646; c=relaxed/simple;
	bh=8MWKvLKrIhwESL6K2lYU1hcXZLjKr62HLpiR+lptuBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b5DYE1X2PBW+wVrDbWv3FeN7uXja150vLvsXPLbEMTRVQj9p+kWuyNJrXkHFCJi3Kzhx43a0D43TbuvQ9GEE48u5/vyaALZcFjOAeJ24QRKsDcxSehY805NsG5FKiNBlcY8jlcYEV6n5LG2wA0NTux6J9aNbNYsztemk232VdmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cH3BAs5X; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cH3BAs5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1766263632; x=1766868432; i=w_armin@gmx.de;
	bh=WUXnniPV7qpv2Ba8+v4zPdnBdenui6dm7evYQTvUE04=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cH3BAs5X3wMzUsKRrbLmr5lDObkYolTZ36uOgAp56JolgWStQemDBfdbrK37RwdB
	 XjZgIVGS9Lguwzuy5sRg7Tpn09U4FZ7TJQm7zWvPwCNuZkwNFJs5HbTkiqKTLJ1+U
	 86AAFoocXvwvfzdYBcU/+mT7T1U9FhmIxyijZXSN0AnndFE9G09npXFQ4U+skK/Pz
	 6bPFsp+ZrjLCSuSX3NEQzRRBG7fE5cIxjx3Cr0wNrzhpIXWrNhBA2SLfKrV3oyCSI
	 n16ArqnZTcR9TJKjaIk9VfmrU9voWWeMdu2NpeffF1zzMpnJpHDDsoeIsqWrBopLP
	 k1G4YYjq5cXmPT0dQg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MIMbU-1vjDTs2eRQ-00G4dQ; Sat, 20 Dec 2025 21:47:08 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 9/9] platform/wmi: Update driver development guide
Date: Sat, 20 Dec 2025 21:46:22 +0100
Message-Id: <20251220204622.3541-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251220204622.3541-1-W_Armin@gmx.de>
References: <20251220204622.3541-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fB+YMWr/OGeEizknCs6WChgvzdA9egoa9XTzsCZSDg91VpSvLm0
 pH7bm5Spgxy6VYaT2L+r/8GJN2ghnu3y3sY4sHgFtEiFXV7Im8OFRkstCA38I4frVgs7BEb
 tlQ7y1wlsAJWsI0y20ARYDhwj8HaSG5lbeYSrMoB93anfkWUZ9ifhvF8Hg4MOWpdnwuqmwT
 zjVbxICpdLxpR21k8v2Dw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RUcVby3TTQw=;VdMj8Qf1ffXNsTqIHwyRcoS69d0
 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
 BXRh5pvg=

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

