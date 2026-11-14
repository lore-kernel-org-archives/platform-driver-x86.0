Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647933;
	b=YIUHVqyyMoaZjKIR1adGiTDghhb6ZUzjkZa5eG/wxmJ69afAJQ6kCS7YL5kQ23oPCi27
	 2GsNxkFevf7vhOwyNKJkEXQxzT37zWc+EEPc46eWxgsya/glAAHzG8SSxCSNMx7PXDR0p
	 XBSCNh6CjEs09AhluoQXDhF8JOuOmbIQVA0ZcYx1svY2Z9F3jtiQ4vafauZ4yxnvkK5fN
	 /yGfGcOblpDSLgCjabSTvF3bIASl3IJSj+DcEls77hfgtkTogYNz7dTW+cWvkrtAqiQp3
	 b8tOgkqJcPR9/W42nn9lXfmy51nr1x1VvZ/qfZ6J1m1PCZ/VMoB4YuwfgiVkVmo1CoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647933;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Gz3KKFRryx5hUDVGRfrpX0HToTf6dzLn43PKIFAPbC4=;
	b=kfX/BfWX1y+snc4QNoq2yL0aF9do+6LYePZUHZuEHDW+6Cy5ENX2LQah8LrhMdIAsU+I
	 aq4PmOkk6pQDJ7gn7Tzc0UAFBnhtS8SBjBpvqs/5+sd3L6fczwdHqKDfs2oOkiSanOEMQ
	 vofkNDXSQz237TKK2mXiIyKHMc+0v944aWa8R3jMwCs0nEjmZNPeZyIrMTQ3GaL326U/M
	 oEO4rpQobHfEFzmM2z7zE9BPc1hV3Wk7zN1aJ2aa3JowB6jS+yob3xZYuAtfezSB3VU3B
	 fJLdtkA0lUnzM1Zlg4d3GZZBfemn/mph0t25WziJP3a1+tHynfeVy4oCoVKE4J7SchA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=O5TzIj1p;
	arc=none smtp.remote-ip=79.135.106.101
Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E239F606A32E
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E239F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=O5TzIj1p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794647930; x=1794907130;
	bh=Gz3KKFRryx5hUDVGRfrpX0HToTf6dzLn43PKIFAPbC4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=O5TzIj1pHv8eZKt6xCGtHUsesZlQiqSxdVQ5kmkmi6e2YOfjHyrquBN7AMi+cujoE
	 ZTGeno3tYfthtuyrycmLi3dC54w1mtQ/X17o+qZUSZByifjz/pleso6HHQbib8b9VT
	 JB8EKNxduApoyIjF3yhPm3Y2bxi6OAu8DcMWzZqT7RNkqE3d2btiDe7PkmWltN030G
	 XTDCRyFkXt1QuIdvoVznaBrbCrdyh81vuRnjUlv9GbyEOo4ZdHpXBFXWNhXFv2I0fZ
	 xw4CVpE8U2lkMJN46jBCdixbsmWFOXQqQ+1k9grvoQn6k2vMWdaNPhfTYxuTCY0O/l
	 qu6s4sDfElDqA==
Date: Sat, 14 Nov 2026 09:18:46 +0000
To: "luzmaximilian@gmail.com" <luzmaximilian@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
From: Jan Baisch <jan.baisch@protonmail.com>
Cc: "hansg@kernel.org" <hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] platform/surface: aggregator_registry: Add Surface Pro 12 (Intel)
Message-ID: <tFBQSOg6K9g5HOowRo8KoZG-Y15izMI0sXN0GP6gf05nIxHc2KB2j_Btfm4gaZNgHwVAIx72Kcyf3r8h-DDjtWroVqCvsXO0P2pAtrc4huE=@protonmail.com>
Feedback-ID: 214690547:user:proton
X-Pm-Message-ID: d2f89c1a98ec370c480a13f02aa6c7a52625c60b
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Surface Pro for Business 13-inch 12th Edition (Intel) uses the
MSHW0743 ACPI ID for its Surface Aggregator platform hub. Map it to
ssam_node_group_sp9, which the Surface Pro 9, 10 and 11 Intel already
use.

Tested the registry entry on CachyOS 7.1.6. It enabled battery and AC
reporting, the Flex Keyboard and touchpad, and the fan, thermal and
platform profile devices.

Link: https://github.com/linux-surface/linux-surface/issues/2144#issuecomme=
nt-5226162312
Signed-off-by: Jan Baisch <jan.baisch@protonmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drive=
rs/platform/surface/surface_aggregator_registry.c
index cf3ae252b..dda434e40 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -461,6 +461,9 @@ static const struct acpi_device_id ssam_platform_hub_ac=
pi_match[] =3D {
 =09/* Surface Pro 11 */
 =09{ "MSHW0583", (unsigned long)ssam_node_group_sp9 },
=20
+=09/* Surface Pro 12 (Intel) */
+=09{ "MSHW0743", (unsigned long)ssam_node_group_sp9 },
+
 =09/* Surface Book 2 */
 =09{ "MSHW0107", (unsigned long)ssam_node_group_gen5 },
=20

base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12

