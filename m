Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DDF1DFE0F;
	Sun, 19 Jan 2025 20:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737317864; cv=none; b=IdgJANdoacDtOEHKdYhxQMF1kwKBu4S/kBUFtycr3QJW8KUDR08Kg7tosMIXKc0DeT+sKubMxIwA4FDoC5Ay8otLOdU7hKFvo6VNnMskZbMIqd2lOKH9qs26kkWVTZi13KfjPj3qlisCHK/KSQp+AGD/eo2Qf82OxAyB9cfg+9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737317864; c=relaxed/simple;
	bh=WZvzCVKETms1uhZ2vhp0+qofxp6mtdZPmP6gv9/mYKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iaROd1l9vGDmDa8HNET7PxgD6VbhPmIxpMoxHOh8XUOEUam1lNxawY7FKwAoxWJx29URzGhXmdasLSZcva3+Nkq6fqvy8uyWGsepgPrK+iINMlkKuzW+dp7McdbKNfX11JBnZ5fYrl+pGz+LEnlfP4qknO+dp9G1je+q6fOSiiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Lc108/7b; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Lc108/7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737317853; x=1737922653; i=w_armin@gmx.de;
	bh=Gf1BJyYN2y6x6i4TWAZX0lC2uSECvU/yZn7ll5BmABY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Lc108/7bHdX8fCKk6/fHwjucWkTp9jprTqzqRKzo2z+Kotr2BTEBGIg7eEFYmsJM
	 7ZmuwjvoYQczBDKB77kN59i0AVUZR4oMvFCvOjObyBjkGUnQUhUa60Qt0Zj2XlFPr
	 1w549fxSLgmdCXrFccxGfC5fT4BVJKKcS4KOoJ3nVoL0SWB3qr6cFkfRrMxDzZhT0
	 VS9LbCp97xKJSLe3XNE9dvd+KCdXVxlnOo7JL0u/zYxzQQVTuyDIO6ZdV4qBFbW9l
	 GAv6bkEGDcVvP93cqca+hL5ZG9Xj29P7fToeterDhAYoBKhwanD3hv4Ol6BHEeFSk
	 DMIjvCpZzgesQcFdng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.251.118]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1McH9i-1sxEZt0cKS-00qFrs; Sun, 19 Jan 2025 21:17:33 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: farhan.anwar8@gmail.com,
	rayanmargham4@gmail.com,
	jlee@suse.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hridesh699@gmail.com
Subject: [PATCH 2/2] platform/x86: acer-wmi: Fix initialization of last_non_turbo_profile
Date: Sun, 19 Jan 2025 21:17:23 +0100
Message-Id: <20250119201723.11102-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250119201723.11102-1-W_Armin@gmx.de>
References: <20250119201723.11102-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:66J0c/jWZZilogv+zzSNInbqvbIEcdOdKhzYdZq9+b/qjXW8kpU
 uYb8lySG2cZ0jrVV7slkb7pJpxVGeTc9kf/l82ZJ4QJvIE21drh7e4/HFmSK194CZXZCjAT
 nSHMhucOtCjG9hib+zfkPsIwy5giWERkSblCk7dsnLB4yIPrIZsOKfzNCo52E/Sww/C97DJ
 xQz7fBKRbBHV2ykBsQVnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8RBkfj6Gahk=;ZK/xyd+cO63hdaGX1UxODBYWI+b
 lCS+A1XSWukULs9Fi1fATp7NBjfs6ldWqdKenB01rVN4u0yAU0wtPIvQr4/Gs8VqL4lex/Q6C
 3qs5OCIQhSlkS9IbdmkFzLfm0HDMr3RCZW9NAmwtEmFjfoZmUBtQ4i1mOfVB/oF/uFCQKj7Dl
 SVK0swLveIwAiFfKMNljglvCcAyAWsQQbR3DdHzkre+IkleBRvy/xAmQ85CSR5Vr8YRV0Yo1D
 KBvhAcOKOYswJDuC9XLeQ/2XI1nDVpI3NsI3+EeqXeKt0kkreoCxc79SGQBB9F51MfZ2brSAI
 ftU+Z8MQ40QZ2YLJYQld3P+/kFOg99xXRxTnkx+WOrv5i1NfTLWYCP8EEYrBYQGClW9eJge2q
 Z4UG5MNYcX9Tr2qKCxHYD7o44fpBgDBO7L9LA3rMRqY6WUidyGevCOD9aT14X5StoDgpY9qth
 Cr5SMrhVZ8UxJC+DLRuwHi6LkSBE7IDfhV2HTmRBqssd8PxEnv1onBPgsu5siAV6zobgLMEuc
 XnVR1Xgf7XmUl2Cpc4VOx3ZpOGhXqaJ24t22NJS1DJCws48AnJkmxQPOQd/P6/4Sja7FOpWzV
 BXtg91o5Z7O91Jfc0vtG1dhityEv1CbT1DvYHtciTaf+4zSa00mHjXozg9GfkYTI18+XgECaA
 3his6b5Q5/HI6HeryKxepKG/2eO61LUFGBXyQjn4gQYDrExlP64DT4YhageDJlNhZ7rlhnS6D
 cg0QMTSmIdieY7dGpKYabk7g+/M7Ah99Fperhq0As8+MjrPhFJeq4C0nbrWQ28PyE1gs6O9zc
 S0RzcsPkq4aNzzkEd00BoDrqibM7ywba9IDSnN2Tir+KgkU8nVQCp4RvEnsXkbRjNzSqiRHsG
 4mCoxV5oQu9jxENdvtC0VZMKKXe9NjFSkfb3bjY26K6FsLc4V8Am/NXxtgYD+zlnvZvV/X0Fb
 00Jx9JoWQufmUx+ybcBTKqKgbybWFgmYTCCTgjimgkZdv3JQISjdF/6TbxCiJljFUmHo9w8U5
 zmRYS0yAZONh5pq6/qUoEzc9weWPRnLrYh8U7l8jMJn3BGIM7AklhwX1HJEfajfF5mydBzP7a
 E5jJnDQMztW0dEedNuJ9jJqAT4TlLEHmlWv6FonWKcgbXC65uSsaSPlJFC39l9TxBzGlCgTIV
 RxgaumSW2NDh5rAP6cuusboQ/1jduFogqtdunVreFh/6Pn/6eEp5sEoYXv3d7cv4=

On machines that do not support the balanced profile the value of
last_non_turbo_profile is invalid after initialization which might
cause the driver to switch to an unsupported platform profile later.

Fix this by only setting last_non_turbo_profile to supported platform
profile values.

Fixes: 191e21f1a4c3 ("platform/x86: acer-wmi: use an ACPI bitmap to set th=
e platform profile choices")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/acer-wmi.c | 41 +++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-w=
mi.c
index a85c881d1f24..69336bd778ee 100644
=2D-- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -792,7 +792,7 @@ static bool platform_profile_support;
  * The profile used before turbo mode. This variable is needed for
  * returning from turbo mode when the mode key is in toggle mode.
  */
-static int last_non_turbo_profile;
+static int last_non_turbo_profile =3D INT_MIN;

 /* The most performant supported profile */
 static int acer_predator_v4_max_perf;
@@ -2034,32 +2034,43 @@ acer_predator_v4_platform_profile_probe(void *drvd=
ata, unsigned long *choices)
 	/* Iterate through supported profiles in order of increasing performance=
 */
 	if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_ECO, &supported_profiles))=
 {
 		set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
-		acer_predator_v4_max_perf =3D
-			ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
+		acer_predator_v4_max_perf =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
+		last_non_turbo_profile =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
 	}

 	if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET, &supported_profiles=
)) {
 		set_bit(PLATFORM_PROFILE_QUIET, choices);
-		acer_predator_v4_max_perf =3D
-			ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
+		acer_predator_v4_max_perf =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
+		last_non_turbo_profile =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
 	}

 	if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED, &supported_profi=
les)) {
 		set_bit(PLATFORM_PROFILE_BALANCED, choices);
-		acer_predator_v4_max_perf =3D
-			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
+		acer_predator_v4_max_perf =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED=
;
+		last_non_turbo_profile =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 	}

 	if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE, &supported_pr=
ofiles)) {
 		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
-		acer_predator_v4_max_perf =3D
-			ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
+		acer_predator_v4_max_perf =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMA=
NCE;
+
+		/* We only use this profile as a fallback option in case no prior
+		 * profile is supported.
+		 */
+		if (last_non_turbo_profile < 0)
+			last_non_turbo_profile =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANC=
E;
 	}

 	if (test_bit(ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO, &supported_profiles=
)) {
 		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
-		acer_predator_v4_max_perf =3D
-			ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
+		acer_predator_v4_max_perf =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
+
+		/* We need to handle the hypothetical case where only the turbo profile
+		 * is supported. In this case the turbo toggle will essentially be a
+		 * no-op.
+		 */
+		if (last_non_turbo_profile < 0)
+			last_non_turbo_profile =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
 	}

 	return 0;
@@ -2080,10 +2091,6 @@ static int acer_platform_profile_setup(struct platf=
orm_device *device)
 			return PTR_ERR(platform_profile_device);

 		platform_profile_support =3D true;
-
-		/* Set default non-turbo profile  */
-		last_non_turbo_profile =3D
-			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
 	}
 	return 0;
 }
@@ -2101,6 +2108,10 @@ static int acer_thermal_profile_change(void)
 		if (cycle_gaming_thermal_profile) {
 			platform_profile_cycle();
 		} else {
+			/* Do nothing if no suitable platform profiles where found */
+			if (last_non_turbo_profile < 0)
+				return 0;
+
 			err =3D WMID_gaming_get_misc_setting(
 				ACER_WMID_MISC_SETTING_PLATFORM_PROFILE, &current_tp);
 			if (err)
=2D-
2.39.5

