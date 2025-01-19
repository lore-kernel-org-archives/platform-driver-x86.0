Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96E51DFD84;
	Sun, 19 Jan 2025 20:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737317861; cv=none; b=UMtYTsWPNkUE6VRjmWhmtbe8IUMf+GzWjQjV2o6iCA5qdJ49DZP3MuXBSgQLhOTYmfyi1qFph7nhJRWQz6pGRWoVIZWHXlHoFyMTAz2VxlfvTXOtrrNc+cjcett22ERwpnH6aim7ZkcKFe1U1EjEoDTYSb16ehl3QIM3P01tReA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737317861; c=relaxed/simple;
	bh=7jM/T02+dbwkm1MsxR4hGSG8Lkbw+FKlMYB8yalbQo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jFZCQVkgCksRTNiDMQK/yNXa4wr7RyZu59TBb9yl4j0I9U/TYoCHLQqpFZNQwyHh8uS+ShhxIrclC39+CRL4t3kWq6sMgg8X6OYhBFwW86tvlnZqiHJJrNz+8etl0njqgGqapIaIR+byYZGVLjF7ZXRzBPovwLn0fBqEjVpZvRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TzKUlJQJ; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TzKUlJQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737317851; x=1737922651; i=w_armin@gmx.de;
	bh=PMhwv8pLMS/7h7x9upv7SpRYjNPc1CWi7y7A4f7nvlo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TzKUlJQJoIQtd56KEpxo91APrG0zdTrufUUMHJZsCiLQ7NLNm3mkuDR3WMuiI2rw
	 ZE5VGH9VmmiMNaTEcj9ZT7MBGSBADBFXfyZWucxbuloiKRSgV6IaG5BpiRwE+jA7q
	 eJTyux1CtFeUw5VYWGDtyvYvUyoCMHgqnxMMNA0dQHy2Lvl/YjfM6GbOkb3r2rU/e
	 QpM9nJdaSEFaIu90bVgY0etrmHkH4M6xGCKi7Zei6TinRCf0CNbZxhIMGsRov7rOZ
	 dGtGBVsiztFd+XbZ469QSezOBi8p+fmKNr4df5ehe87oajqUTmd4reIdfnrHr9K8C
	 RFApj0GDS+pLKf2WuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.251.118]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mv31W-1tI4ok3lGy-014kbA; Sun, 19 Jan 2025 21:17:31 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: farhan.anwar8@gmail.com,
	rayanmargham4@gmail.com,
	jlee@suse.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hridesh699@gmail.com
Subject: [PATCH 1/2] platform/x86: acer-wmi: Ignore AC events
Date: Sun, 19 Jan 2025 21:17:22 +0100
Message-Id: <20250119201723.11102-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250119201723.11102-1-W_Armin@gmx.de>
References: <20250119201723.11102-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hTZV00Ar9yHghusgXXddtSBZL82biRRcXwXPjG/j8MEMpK0uehW
 yOCig9rsyrhNeLqcPpgxGVrA+9sSO66NLlsTiHgSvWq+F85WTURqMH5ZaMZcNwsVLagYEMR
 gnwQV3cho+4fRgvgvuWL9xpqtwx+8Bn6MWEnsij3yY5BzMw3L8aN5t48us28pofwTp+GodK
 wwgh7jE3XuOhMMlEmBECA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:S/A86dc8PMc=;Tx4sXrHLi36P+4Hw8jIuRBINKsL
 UeqaCKq2PM0f0FRpcd0RcTHAeUQFlw5jFZGuPzaLQ0duA1k3q+o9unHQ7q8tyyaK57hEzOGEF
 gGbhH7dQBuqucv8YI2/sUzY7I2D2wPHc29BZbS3eqqOO6IhuSnZXcRB8ZT4bTkCEBt+l8fEd/
 3/qktuwnVHJ38YbuQ7BAVpa976JqVgIpSQNz/8/WlzLk0TyQuuuF0BA2+TbNvXeqCrGyXxoPH
 3CePyp6EMM/cLyyv0gxqUT8cs9r3mupgtQRhvLWDQrFjtGPCY/NZw6De10arijiJY6TbBww3b
 JNufTosAWMvmE1nImkRofDo+UEWTvyoAc7lpjljH0JhEpbnB1Apyc8kLbNzIGUntusqOBULxU
 jAeERq3RPLqFNVF3G9ODE05ilaSy4gHD3nH46qmf+VXLbP1LM9aoKJkeK8/qBRKhWJpIEf+e+
 EE2Ci9DJS/L/FHkhZ4L83rimaE54stzYdYOnH74T0u5yUgx8mNn00T1J2LswniTMQZTuc9oay
 xvlAoIe1dKljLvUhakdlW5Gw7eQFgT7uvrkk1r37PTxd3XDoPdgO0/Kbip4Qzv4lS42A6KXKO
 3EN57ckfeY2CaR/HO4CZFGzLjFyZ/tkkQ2SoC6dc6QLFsNwmynm+VSQaD8EVmc/ojhkI/8BX9
 qHIFGciVm6eSYDr7uvnerdA1unve23iaDOCafQYwFu5nfGzfm5SiVJDM8Fr8HdoNBDLVutBCh
 WTOmtggWo9l4SS59AFCRJdn/bFNiRFaLMKmhqP8jUZqiI7mBgAWQd9LzL6r8ubQSQdzhRmvbT
 yzMawwQuep7EewXqxSEQJqsm9lqVh/PaaXLLo+Bv5Ryk1Kf6jJdIQyn0+0SkBzplmq/IE4BHj
 lF1Ju8b64f3YN/K0WZ2SHJkBml9krBsrlEmnfNYMVQirFP9R2md6F9KqsHuj97+5GX8HVb8hj
 AyTKKSVvApvV0atPLRWK5ReAOf0AongM2kd8fxAQE1jRnROdPlgdOI/3ZlM718wcJtZmv1YGz
 8K5Ju8ObAlg8lx8mUvmYghbI0WOYEXj2L1NgA/rhT0XEsBOd+qJBuzdOT/QD6OFKZslNmPYUY
 N13kTI935KghNUKViZ07P46Jj1rFMTPqQFqk7on+K0dVnJStoxForvuFTzEwxxuEyU26CXHd0
 R0I/diSMbalEPbjmqtsFmQLPXbfiHJ+SoyMIOfXi5lfuPBdvU+241eVE2Uxb/0qw=

On the Acer Swift SFG14-41, the events 8 - 1 and 8 - 0 are printed on
AC connect/disconnect. Ignore those events to avoid spamming the
kernel log with error messages.

Reported-by: Farhan Anwar <farhan.anwar8@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/2ffb529d-e7c8-4026-a3b=
8-120c8e7afec8@gmail.com
Tested-by: Rayan Margham <rayanmargham4@gmail.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/acer-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-w=
mi.c
index ae2a7c93ab72..a85c881d1f24 100644
=2D-- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -104,6 +104,7 @@ enum acer_wmi_event_ids {
 	WMID_HOTKEY_EVENT =3D 0x1,
 	WMID_ACCEL_OR_KBD_DOCK_EVENT =3D 0x5,
 	WMID_GAMING_TURBO_KEY_EVENT =3D 0x7,
+	WMID_AC_EVENT =3D 0x8,
 };

 enum acer_wmi_predator_v4_sys_info_command {
@@ -2414,6 +2415,9 @@ static void acer_wmi_notify(union acpi_object *obj, =
void *context)
 		if (return_value.key_num =3D=3D 0x5 && has_cap(ACER_CAP_PLATFORM_PROFIL=
E))
 			acer_thermal_profile_change();
 		break;
+	case WMID_AC_EVENT:
+		/* We ignore AC events here */
+		break;
 	default:
 		pr_warn("Unknown function number - %d - %d\n",
 			return_value.function, return_value.key_num);
=2D-
2.39.5

