Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEABD405C4F;
	Fri, 12 Jun 2026 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781285706; cv=none; b=kMikL9CGsaubSBNOyNeXxnT1i61J0EPVJewhTOTDzGnJAI7dW5uUZRHDBJK9m6K289r8QRvcNkRRhtC+CGtUTRPbT6wmY7+tD+AEEDDJG5ov+ldJnJ5OTEDYSCA/WlFKiosaB0EcShal4QKT2SWAQD6dyr6gu2AJCYL/jEQbMd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781285706; c=relaxed/simple;
	bh=uqwzykMYBhpdPXjp9AWgXPgat01DRGebMDgGs3tNb+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TsgmP/g48ewPxyC3CZ3iTO6vuEbZf6D3ehDR5RrM6hz3kIf/GClgwE7xBIMuCKAKZLdYiu1oSiR1NibIDBhYjZ2s7IL143muz4CwO1iZeKuxesmo7c4hdTpJqA2TJwGdMoQh6q2ORSIYHh5CSNjtrGhJRwjBEcUEUMe1wIKVLfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=niC4M8LG; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="niC4M8LG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781285697; x=1781890497; i=w_armin@gmx.de;
	bh=SZ9rNZaBe+K2dCQwH350D1snJlYgchwMk0nQmWxDvao=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=niC4M8LGLDmjz/v/qkAC6YZU6mRFOSpbJUjidBimiHQUqbVlogS8IcHVAA43fNwB
	 IHXnM5B9Qxu9rtMm+qaIIqqpzZ4BHkRorrFJOUyPLO0ePJrETrWz4KArKKOMCRCTx
	 8irmdWTQN1UOioK/S039YLOxMbUi8Eyh4qTA4rp2NnG7Daw3vSR7pQz5yOftMiD+M
	 et2TWBvFJQQfh5xJ5wIXBWwfhlhKQgUWkg+db2ElU4dlHw+88l1dXLL4wJl5E6AOK
	 gLE0e/gl2nM/Ax97L2cb1yArKPshcMT81P5vzZqfyA6bO86F1he+Siohnhh9rZNCl
	 UrcBU6GKYYZqQEq/+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MC34X-1wMJYK1S7J-004MTe; Fri, 12
 Jun 2026 19:34:57 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] platform/x86: dell-ddv: Use no_free_ptr() to simplify error handling
Date: Fri, 12 Jun 2026 19:34:51 +0200
Message-Id: <20260612173451.467629-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612173451.467629-1-W_Armin@gmx.de>
References: <20260612173451.467629-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zRJJppz7CQwpBbr8R25W1FYVNYKBQgwIJx7KQjJtUDv4W3rpG+d
 UpuM22TOy3nDNaZO9dcGwOJClgbAnNDoNBopoeWlTdtyNRPoZVMJ0WXT++VU8q+0OhAT5Q+
 GwGQ3fL8ZaAHnR43Bd0iwf+Nhtbg2Dba49SNo3inEZt39ww/kpaeAsDthqAIdn0/eTmKrzO
 f+jTp8mR9paW9D5pEEBTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7Isf036UZsU=;PY996fCRVOYP/ubGQCITETJ1Wt8
 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

Use no_free_ptr() inside dell_wmi_ddv_query_buffer() in order to
be able to use __free() with the result of the WMI call.

Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/dell/dell-wmi-ddv.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x=
86/dell/dell-wmi-ddv.c
index 736d9b1fdcfb..f8903ced461b 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-ddv.c
+++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
@@ -196,40 +196,30 @@ static int dell_wmi_ddv_query_integer(struct wmi_dev=
ice *wdev, enum dell_ddv_met
 static int dell_wmi_ddv_query_buffer(struct wmi_device *wdev, enum dell_d=
dv_method method,
 				     u32 arg, struct dell_wmi_buffer **result)
 {
-	struct dell_wmi_buffer *buffer;
 	struct wmi_buffer output;
 	size_t buffer_size;
 	int ret;
=20
-	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(*buffer));
+	ret =3D dell_wmi_ddv_query(wdev, method, arg, &output, sizeof(struct del=
l_wmi_buffer));
 	if (ret < 0)
 		return ret;
=20
-	buffer =3D output.data;
-	if (!le32_to_cpu(buffer->raw_size)) {
-		ret =3D -ENODATA;
+	struct dell_wmi_buffer *buffer __free(kfree) =3D output.data;
=20
-		goto err_free;
-	}
+	if (!le32_to_cpu(buffer->raw_size))
+		return -ENODATA;
=20
 	buffer_size =3D struct_size(buffer, raw_data, le32_to_cpu(buffer->raw_si=
ze));
 	if (buffer_size > output.length) {
 		dev_warn(&wdev->dev,
 			 FW_WARN "Dell WMI buffer size (%zu) exceeds WMI buffer size (%zu)\n",
 			 buffer_size, output.length);
-		ret =3D -EMSGSIZE;
-
-		goto err_free;
+		return -EMSGSIZE;
 	}
=20
-	*result =3D buffer;
+	*result =3D no_free_ptr(buffer);
=20
 	return 0;
-
-err_free:
-	kfree(output.data);
-
-	return ret;
 }
=20
 static ssize_t dell_wmi_ddv_query_string(struct wmi_device *wdev, enum de=
ll_ddv_method method,
=2D-=20
2.39.5

