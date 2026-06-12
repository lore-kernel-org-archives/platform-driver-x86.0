Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6668F3290BD;
	Fri, 12 Jun 2026 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285699; cv=none; b=o/16FkETlwnHp0qbkt8GnrKuxNdAbYUBXHR5GeCKcJC/vBBXAq8mt3EocEpRgM5OCI/eBgCTWNiT2c65pAy78PAYXWtuez8AbKFrwahZbQuBGFYNKNi8kw9+e0sCHvwKBMgoocRVA26uosdTu3cq+Rt0tt8qa+lVd1Q6gWXP8+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285699; c=relaxed/simple;
	bh=ic6tGUx5BBWBnNJdmH+Kh4oZqW+fo98nmjjl4+yLVcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JMhTB6LrkqbZWcJHBfJNPJu3Hq/RdMFnfQR1SomOVuKoFlW8dhJgenweah06nfw6imadBAO068NQfab7PRNAUUa97C3hblmtHcsKxXh4PhPuUYHhWeKoH2/WHnjvEI+Z/VagVkB42P6dRcld09aRvSeniodOR0eBzL0rFVQB0oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Ars4QFcX; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Ars4QFcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781285695; x=1781890495; i=w_armin@gmx.de;
	bh=iATUddGeLo3Efkw31FF1Vl0hDmasNG2xGuBo2XV81Uw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ars4QFcXRcKKSBNaovEJDT094CFZwaZ5kT8vqbwW0udING6FlczjUCLWIWCt1gVK
	 q2LFSW38l+SO8CZdQQcUoWd7OyQU3Zpi1+dvN59imCTGWAgV1IBF9LnA8rzzEdF2P
	 7A1a4pVRs8pNw10qlUXpsp40+b/NcBDfymyrMBxh5hP9/zhM7vrCS58LKF4D3DsbU
	 uXEMms+k2RhsFGjprrdbSzoRm5Gc/KpQEUDQBu/fzs1ymO8upY5Ha2YJ23qhieLdZ
	 QjNS45SWAcncByQiMsT/GXJzkEHQO96chEjWTqp7E6wnIGoNhwIGg18oteFn/LOcO
	 6tCixVVgvlZYtyj3pQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGRp-1wr1hS1cib-00WvS8; Fri, 12
 Jun 2026 19:34:55 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] platform/x86: dell-privacy: Fix race condition
Date: Fri, 12 Jun 2026 19:34:48 +0200
Message-Id: <20260612173451.467629-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612173451.467629-1-W_Armin@gmx.de>
References: <20260612173451.467629-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:11PO3RZEuOxdw8NIp5O34dZb6JycPzu3m9FcfJXBDq2EyMml8BX
 JJCUoacN3tEb9l4V71s3ir3FGgEUh8AQu7AeLXHmUSUYJjiQs10oF2j4szmtdRv6tyO+G5w
 DqNzwbIfTmem6zHjK99f7SitzMUpSnDW/hzbnGe8ORfNMYWl9CU8upkylaACIQZbTCACanj
 uoLjgl5S7VZ+PcGV8exDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D93T+zyUvhY=;Grzd0leLvDr0A/L9W1IISeW/AH+
 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

Accessing priv->features_present needs to happen with the list mutex
being held, otherwise priv can be freed at any moment.

Fixes: 8af9fa37b8a3 ("platform/x86: dell-privacy: Add support for Dell har=
dware privacy")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-privacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platfo=
rm/x86/dell/dell-wmi-privacy.c
index f9d275b2f900..366e5b8dc868 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-privacy.c
+++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
@@ -92,11 +92,11 @@ bool dell_privacy_has_mic_mute(void)
 {
 	struct privacy_wmi_data *priv;
=20
-	mutex_lock(&list_mutex);
+	guard(mutex)(&list_mutex);
+
 	priv =3D list_first_entry_or_null(&wmi_list,
 			struct privacy_wmi_data,
 			list);
-	mutex_unlock(&list_mutex);
=20
 	return priv && (priv->features_present & BIT(DELL_PRIVACY_TYPE_AUDIO));
 }
=2D-=20
2.39.5

