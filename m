Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6765833EB0B;
	Fri,  9 Jan 2026 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767995234; cv=none; b=DZLigNuu3CQQaQV2ihMjRmxDSC0ZOp8H4jjsSONYqrw8SKYSAaLmnqNp2wEVZmlF/yE1tPuSIQBeUeP800f78XFUGsjVLK9TKE1vEXyZqYZQNgvTHCzJCFRN+CLzmVtlGujxoCsSEOc9Pwlrnt71/eLfbrZVgIvbisPfwkDuAFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767995234; c=relaxed/simple;
	bh=8MWKvLKrIhwESL6K2lYU1hcXZLjKr62HLpiR+lptuBw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gsFZ5kPD9tnjBgyY6JsjWABnVRfXgcEpMZgnkqYyBR0TVeZWupAPmaXuw4rSHakGghtgigteDIzQh+arsFRSDwvpdf5E5xXLzfju32rPYCZMMsLdlycbNXJes1+EjmO0JzVobCv4k5tVXhv61XteESyj6SJCsYnrxFlikQW3m40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=l+KpN+Ii; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="l+KpN+Ii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1767995216; x=1768600016; i=w_armin@gmx.de;
	bh=WUXnniPV7qpv2Ba8+v4zPdnBdenui6dm7evYQTvUE04=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=l+KpN+Ii8IlLP5/WTpvWBmAGsQuqdtxch7ioy6JZwaxjFw94XFXQeSXtNFEuwDwU
	 jQthJN3IZ9YwTxJuD+XGGIHYCUC3mlOSyyubKIpwXjdAnsUC6GwgxXbe2bMs2hHB8
	 50SAT+N0lVlYEdQpa3k83bGgDu5TE1rtEUcVizTHZWyJBjaUr03tvC9zmhudoVz+S
	 U9sg2Wx1gV4/rFMhGrLzA6M7iSt3DFaxd8CAKMOUejPl1ovfFHuPg8CaHPGq19jiJ
	 XSeSbYVDF1OdPJ76YvGCyVEGQIrXg8X5mZ4tImPSxCtJIQWts7HeVnHNVUMagSqC2
	 0/9OFsMOiw2vxz2VJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.247.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MhD2O-1wIap33zNa-00acFO; Fri, 09 Jan 2026 22:46:56 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@weissschuh.net,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 9/9] platform/wmi: Update driver development guide
Date: Fri,  9 Jan 2026 22:46:19 +0100
Message-Id: <20260109214619.7289-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260109214619.7289-1-W_Armin@gmx.de>
References: <20260109214619.7289-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AdfT4ZPeZwpJTel+dKwH+rXSZSKFIbQBTUMN/PBXO+qIa4moNIh
 BBdXiQGPPF3UWlKpIW1HQpmr5WL30QJxijHcRUrKhihzjd2zLuB/Wd3eYkcU1pq1689qfil
 at+JEa6MWbcI7lN5UxYImi530AvO2Cd6rIqixoz8j+2a2K6wjO2S+AlB24BCntlcgdpRgBX
 SN5No4cPOU713t2crGTGg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q97V7ShoVhA=;l+hv2T/G3DTXJoYX7vFf8XLjtJy
 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
 NX/jltNxTqy3hmmzk2wrr63iuVfnR

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

