Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392CE3A962C;
	Tue, 12 May 2026 23:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628125; cv=none; b=gMCJQlF8bdbvHMmG1AuaNCzEcVryHD9Dj0VSSUMfvQEBqKO/jj+fWvHw1sSSHLJutt6JYqHlpxyU7CEcgyXuI+i/4LYUfo0KlymE12aG74PnqCsG3AZcp4FaNSBT8XyQkMjbfliPQCsGFVINWnaWsIjc1xeJw2k4hIbjAtL/k1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628125; c=relaxed/simple;
	bh=F6ZE0Mvz6ffWTpIEfMhgI5RNj/+43rVdZwkE8Hb2/LU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pAfC4AB2jZJOZLW3jYRVIZ+7AkyOV19yU0sJNOTpq0itajm6fQYXEusJDEv/tRuslfq1RnVs+8Vgn6d4ZJhyDa0wcuv8XqOgKVFBIH6MjjutdSyzwUz+riMDcbUIq3POfJxNX6jKfMn6CPVtKj2wJAsTEVo70f8gFHwbZkMo/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YdSam0Pk; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YdSam0Pk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778628119; x=1779232919; i=w_armin@gmx.de;
	bh=RQUKQGjCSjVT3Q8m2h4mwRJvQmrU3ttiGWv8bSvc+is=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YdSam0Pkv2KdihC4v5ylmnLQ+/SPJQ5yODrJdUUIKwqQfzCyYfjwE53W0NgTaAYQ
	 hYKDR6lp1CeC3y3Aj1o5TrhxR+KpbZlGImEPV73b/Y/jUavRJ5sy/F33L9b+R59xn
	 ObaNkHn9ZoUKQIV7+Y6ljjhESi9V89RQIzBJCdBRG2EFtEbENmKq0EFIvWgZn34K4
	 Uw/1S9SwppCvUm+HyoqPeCbqk2SiUXpCwA90z/Z38CQ/bpzmkMD+lohnaXeuamwwb
	 QLtHeiswVI8Up05YzkIJxX/j2Ehg3YEa8KcMHGm5P3gr+6Ovaf2d3OvNvGNXZEQFA
	 qkVg+DdtylBg+CBLGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mdvqg-1wwXtA3gzm-00obF7; Wed, 13
 May 2026 01:21:58 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] platform/x86: uniwill-laptop: Enable battery charge modes on supported devices
Date: Wed, 13 May 2026 01:21:45 +0200
Message-Id: <20260512232145.329260-9-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512232145.329260-1-W_Armin@gmx.de>
References: <20260512232145.329260-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wDa/N7qw7hF9I4PKD6/+JCoDTAYBDMrQsGp8Cv1L9vH6qjEFkEb
 nowf0zEvIbCUDoILMLzS6NQsX7KjIRs8EyEuDZJ3snkrfJDVwsL/q29mUSzvjmNqQ5VSlcV
 3u+Z1kCKy8UGG8nRnARne7Ln1ol8OJs2eTUxtp64DY58ovqdo0qR6YC4F2rIJFKugUQlPGL
 yU+qR1gVRefd0xWsJ7PcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wE8n502MglQ=;/jWDqPRL2j0gJvyNvh/ZMs8412p
 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

From: Werner Sembach <wse@tuxedocomputers.com>

Enable battery charge modes on supported TUXEDO devices by adding the
feature bit to the respective device descriptors.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 53a05a05c594..ab063ead45b9 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2168,6 +2168,7 @@ static struct uniwill_device_descriptor lapkc71f_des=
criptor __initdata =3D {
 static struct uniwill_device_descriptor tux_featureset_1_descriptor __ini=
tdata =3D {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
@@ -2177,6 +2178,7 @@ static struct uniwill_device_descriptor tux_features=
et_1_descriptor __initdata =3D
 static struct uniwill_device_descriptor tux_featureset_1_nvidia_descripto=
r __initdata =3D {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -2187,6 +2189,7 @@ static struct uniwill_device_descriptor tux_features=
et_1_nvidia_descriptor __ini
 static struct uniwill_device_descriptor tux_featureset_2_nvidia_descripto=
r __initdata =3D {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -2198,6 +2201,7 @@ static struct uniwill_device_descriptor tux_features=
et_2_nvidia_descriptor __ini
 static struct uniwill_device_descriptor tux_featureset_3_descriptor __ini=
tdata =3D {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN,
@@ -2206,6 +2210,7 @@ static struct uniwill_device_descriptor tux_features=
et_3_descriptor __initdata =3D
 static struct uniwill_device_descriptor tux_featureset_3_nvidia_descripto=
r __initdata =3D {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
@@ -2231,6 +2236,7 @@ static int phxtxx1_probe(struct uniwill_data *data)
 static struct uniwill_device_descriptor phxtxx1_descriptor __initdata =3D=
 {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
@@ -2256,6 +2262,7 @@ static int phxarx1_phxaqf1_probe(struct uniwill_data=
 *data)
 static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __init=
data =3D {
 	.features =3D UNIWILL_FEATURE_FN_LOCK |
 		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
 		    UNIWILL_FEATURE_CPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
=2D-=20
2.39.5

