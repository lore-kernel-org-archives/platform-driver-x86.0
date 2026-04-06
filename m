Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEFF33260D;
	Mon,  6 Apr 2026 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510238; cv=none; b=HibeHBFl+zBdFcauAF1zmSoU/+nQS8NVxWk64ekZHOhAFn73ZirLPsjRh3wdkoxucgt14qRUmQtideyro7xuIltVmVobhaetJ2Vry3wLVdGUA6kevq825Y2NAIL0eD8A1sN7107At3otdlW4FdbEjDDQzIqnkwltzYZi0voyqYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510238; c=relaxed/simple;
	bh=y6rM9x3OMaweRgBs1wDwRufP1RftALU55yP7etONiIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G/NvYJnypnDzaIaMYzuZPgpOf493xvL+TXLBhbloNXM9Kc/sSw66iwvMidl4stFmuGbN8PPYP/pFMdp+OJttTm8zGe9CMa0az60D7YrGSihzJ4z6J6mE906DiYTJ0fh7h9Q9PG+9R+k37N4FiIJTxGvw3EkN9GrmsZCLaDIyZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=apYdXbL3; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="apYdXbL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775510235; x=1776115035; i=w_armin@gmx.de;
	bh=pEu7wRNb1QX/EybayJVM32gpFHWladDLYKKtsJu41vU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=apYdXbL3KToTHhhFUvEJNcjDZSEHgzN+ZlTwOmOZ7CK/gCaO01Ovi7RiucpIR9dP
	 GhIVk5ia5f4dsGqPpgargp2GUFQJXsbsve9mx9QA0DQwzFEoKLjEpidLRVHHSORhM
	 a1/DPKn8VEJO+1q/SRuxq0HvCPQX2yGSilXVKvbC+7wddyQI/DKLjQxRJlvbRsvxQ
	 pikXaxiKwjcVCRVLgOUnqX4HsOC9xnQipuVrU7NvoePrDSbT4PABbK13J194I0XKK
	 sNpOb4r577qrYkSrd83kGdEgoFuHb8TnwCh/qPeqQfAQBPXJ6c76Ywv2rgltqnkbD
	 a1JY+Ldpf/4sfBJwcg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvrB-1vXnwE0RXp-00ZZlS; Mon, 06
 Apr 2026 23:17:15 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] platform/wmi: Convert drivers to use wmidev_invoke_procedure()
Date: Mon,  6 Apr 2026 22:32:33 +0200
Message-Id: <20260406203237.2970-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406203237.2970-1-W_Armin@gmx.de>
References: <20260406203237.2970-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:27qOhNQm/7EGWVFmS6ssespCOXCoifQ36b08WIH683AItxbhaQm
 K+KC6K4MSZZofiw4Oc0df/qmfogfmx0lcX4gb4/1kZqGvPHGGmiE4MqD27vRYLuZ5G4Th+M
 aFyZCXowXvh3TID7hf3/KzeyZa7fFetBbFu/PMEp8IQ+wGyxGU8PMvvASHdH8ck3DUinc4j
 m3gx6XbgD7ul17gNScYEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:id4ocQoIEQE=;1HecE34bxtXC91nZoXRBGIqcz4R
 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
 tdBMrRXv46Z

Convert users of wmidev_invoke_method() to wmidev_invoke_procedure()
where applicable to prepare for future changes.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/bitland-mifs-wmi.c      | 17 +++++++++--------
 drivers/platform/x86/intel/wmi/thunderbolt.c |  2 +-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x8=
6/bitland-mifs-wmi.c
index 54380708b7b0..cd3cdd087511 100644
=2D-- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -167,23 +167,24 @@ static int bitland_mifs_wmi_call(struct bitland_mifs=
_wmi_data *data,
 				 struct bitland_mifs_output *output)
 {
 	struct wmi_buffer in_buf =3D { .length =3D sizeof(*input), .data =3D (vo=
id *)input };
+	void *out_data __free(kfree) =3D NULL;
 	struct wmi_buffer out_buf =3D { 0 };
 	int ret;
=20
 	guard(mutex)(&data->lock);
=20
-	ret =3D wmidev_invoke_method(data->wdev, 0, 1, &in_buf, output ? &out_bu=
f : NULL);
+	if (!output)
+		return wmidev_invoke_procedure(data->wdev, 0, 1, &in_buf);
+
+	ret =3D wmidev_invoke_method(data->wdev, 0, 1, &in_buf, &out_buf);
 	if (ret)
 		return ret;
=20
-	if (output) {
-		void *out_data __free(kfree) =3D out_buf.data;
-
-		if (out_buf.length < sizeof(*output))
-			return -EIO;
+	out_data =3D out_buf.data;
+	if (out_buf.length < sizeof(*output))
+		return -EIO;
=20
-		memcpy(output, out_data, sizeof(*output));
-	}
+	memcpy(output, out_data, sizeof(*output));
=20
 	return 0;
 }
diff --git a/drivers/platform/x86/intel/wmi/thunderbolt.c b/drivers/platfo=
rm/x86/intel/wmi/thunderbolt.c
index 47017f2d7597..9b1920d61674 100644
=2D-- a/drivers/platform/x86/intel/wmi/thunderbolt.c
+++ b/drivers/platform/x86/intel/wmi/thunderbolt.c
@@ -34,7 +34,7 @@ static ssize_t force_power_store(struct device *dev,
 	if (mode > 1)
 		return -EINVAL;
=20
-	ret =3D wmidev_invoke_method(to_wmi_device(dev), 0, 1, &buffer, NULL);
+	ret =3D wmidev_invoke_procedure(to_wmi_device(dev), 0, 1, &buffer);
 	if (ret < 0)
 		return ret;
=20
=2D-=20
2.39.5

