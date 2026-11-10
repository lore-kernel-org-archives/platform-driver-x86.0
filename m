Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276073;
	b=Blqm5XdeC85zMN48+wKy0GM01CzrpyBK7TAs/af2Naf6PKnyn2JIEwr7smLlKZQD8eu0
	 +eYmRD82PfKHrRJezfwwGyjMqoepFmhJdRQ8gl8hQ3N1xjHHZBnxujkI53p71SpOWmQy6
	 UjdR1KG6tws1EarCZjrnjJkvqK3xpDYG0QKWKmcAmr9fLtaYsKbAG8qpNGdAo+3wk/hEW
	 v3wk7D7wdUE6Pl7/98PqJOWXXavzbrqX+pf8KtuhIkwnyoTdjUNpL72nOm0hszPU2GO1U
	 uvRMcy10R6lSwYTEA9uEXl14jxRdlLQFpCxCWnVeWhLYM1/29QVPz5zZRLa831HaSpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276073;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5379CRQJx8I15aivicNrF0oYqHlT2w74jNzhiFSUHZA=;
	b=KOAKhpyC+0aeyjI3SC2eAwcAVZ/5NzErroas+ihnC1X8oZcSV1i3Bp6YNxayso2IVLKK
	 livCYrimorygK6/bDhwHBFqcwAebBHVK9i8yd0CDiRj4VrsQae5U5sNojpovbKJb7vrdZ
	 8J/CIT4VQXsouxD2RDxIrBFKV8A51148izb7lyIROs6g52sG23gCD8ps/NKAeytlqdRsn
	 bg6AVEBoQOq44pd4SA5t8sD+2EGrFInsx38NhkfiRFglE0KuPrTBWHa7PVrNDwVDckrWh
	 S1uIZFFQFTho0MfbdDUdcnRk+W9eHLu9B8XvXJr4WYlIX0eUGyDQftBiF5N9yz5kUOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XgxFppmO;
	arc=none smtp.remote-ip=91.218.175.204
Received: from mta0.migadu.com (out-204.mta0.migadu.com [91.218.175.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCB560A6F5F
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 02:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BCB560A6F5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XgxFppmO
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PzuoZhu6Eoqymm75/Wmyv8NSmRksFQncwoKiOhcjjSQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794276070; v=1; x=1794880870;
 b=XgxFppmOsJOnH/0uadCINXtBXP8vAaZRwUQOySbDFcz/Ee2y3dX02+JFMb92YmzxWBN3mBPN
 IWmdeTyuq4/HoN6zAFoM8mKOENme1tJlAHxpM6DXpTLM79pzIRZirAbzKeovtpQcIV8Wu/bVAKI
 Q2kPTmerjYGpfQWBkEnMzhas=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7b1b72135a9d4e87;
	Tue, 10 Nov 2026 02:01:10 +0000
X-Mizu-Trace-ID: 7b1b72135a9d4e87
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schwartz" <matthew.schwartz@linux.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Jonathan LoBue" <jlobue10@gmail.com>,
	"Khamunetri Clark" <khamunetriclark@gmail.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	"Joshua Leivenzon" <hacker1024@users.sourceforge.net>,
	"Nathan Chancellor" <nathan@kernel.org>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	"Ivan Levchenko" <me@livan.pro>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v15 15/18] HID: asus: document ROG XG Mobile sysfs attributes
Date: Tue, 10 Nov 2026 02:00:33 +0000
Message-ID: <20261110020036.112884-16-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110020036.112884-1-denis.benato@linux.dev>
References: <20261110020036.112884-1-denis.benato@linux.dev>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver publishes the station's model, serial, mainboard identifier,
part number, firmware version and hardware generation as read-only
sysfs files. Document each file: when it is created, what a read
returns, and when that read is an empty line.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 .../ABI/testing/sysfs-driver-hid-asus         | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-asus

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-asus b/Documentation/ABI/testing/sysfs-driver-hid-asus
new file mode 100644
index 000000000000..30e0d17d4cec
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-hid-asus
@@ -0,0 +1,95 @@
+What:		/sys/bus/hid/drivers/asus/<dev>/xgm_model
+Date:		October 2026
+Contact:	linux-input@vger.kernel.org
+Description:
+		Model of the connected ASUS ROG XG Mobile station, as
+		reported by the station. An example is "GC33Y".
+
+		The file is created only for a supported station, one whose
+		model name starts with GC31, GC32 or GC33, and only while that
+		station is bound.
+		The value is one line and is never empty while the file
+		exists.
+
+		Access: Read only
+		Valid values: a single line of text
+
+What:		/sys/bus/hid/drivers/asus/<dev>/xgm_serial
+Date:		October 2026
+Contact:	linux-input@vger.kernel.org
+Description:
+		Serial number of the connected ASUS ROG XG Mobile station,
+		as reported by the station.
+
+		The file is created only for a supported station, one whose
+		model name starts with GC31, GC32 or GC33, and only while that
+		station is bound.
+		The read is an empty line when the station did not report a
+		serial number.
+
+		Access: Read only
+		Valid values: a single line of text
+
+What:		/sys/bus/hid/drivers/asus/<dev>/xgm_mainboard
+Date:		October 2026
+Contact:	linux-input@vger.kernel.org
+Description:
+		Mainboard identifier of the connected ASUS ROG XG Mobile
+		station, as reported by the station.
+
+		The file is created only for a supported station, one whose
+		model name starts with GC31, GC32 or GC33, and only while that
+		station is bound.
+		The read is an empty line when the station did not report a
+		mainboard identifier.
+
+		Access: Read only
+		Valid values: a single line of text
+
+What:		/sys/bus/hid/drivers/asus/<dev>/xgm_part_number
+Date:		October 2026
+Contact:	linux-input@vger.kernel.org
+Description:
+		Part number of the connected ASUS ROG XG Mobile station, as
+		reported by the station.
+
+		The file is created only for a supported station, one whose
+		model name starts with GC31, GC32 or GC33, and only while that
+		station is bound.
+		The read is an empty line when the station did not report a
+		part number.
+
+		Access: Read only
+		Valid values: a single line of text
+
+What:		/sys/bus/hid/drivers/asus/<dev>/xgm_firmware_version
+Date:		October 2026
+Contact:	linux-input@vger.kernel.org
+Description:
+		Firmware version of the connected ASUS ROG XG Mobile
+		station, as reported by the station.
+
+		The file is created only for a supported station, one whose
+		model name starts with GC31, GC32 or GC33, and only while that
+		station is bound.
+		The read is an empty line when the version query failed or
+		the station did not report a firmware version.
+
+		Access: Read only
+		Valid values: a single line of text
+
+What:		/sys/bus/hid/drivers/asus/<dev>/xgm_generation
+Date:		October 2026
+Contact:	linux-input@vger.kernel.org
+Description:
+		Hardware generation of the connected ASUS ROG XG Mobile
+		station, as reported by the station.
+
+		The file is created only for a supported station, one whose
+		model name starts with GC31, GC32 or GC33, and only while that
+		station is bound.
+		The read is an empty line when the version query failed or
+		the station did not report a generation.
+
+		Access: Read only
+		Valid values: a single line of text
-- 
2.47.3

