Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5D822579E;
	Sat, 25 Apr 2026 06:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777099235; cv=none; b=gsWthjVtZXH/pYaYCwR7oquUZs2T/0yZpX6VONU4U1MlyXJcZSbxSZqycGnUpuWzyLGM0bESj8AaYSJ3ryIJIAoKtOzcPyg2ICecHXI9hA7mSE5PDPCr3+/yn+P1E4dFv9Gpr2RYjTjN+GiEF1Sz5LC5WfxGqOT8PQ1URPs8GXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777099235; c=relaxed/simple;
	bh=8Qtebp38PqaSGSAVXBummLHQX3+D42wYyhCnkYAPtvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lelndgcvf9kmOu876h8UZkhzMVOgQbuOhVoP4s+IVFlKsOC/s+czGN7vK7nmud6ihtrizpcEsU1vNd6aAkOHoPLRwvObBLBFXiOOfLAieD39//Tw9flIVL3xv1nThVIb5asW0hY/WmPmuk2114MvzuS6JK5edYieWNWCau93G0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eduardovasconcelos.com; spf=pass smtp.mailfrom=eduardovasconcelos.com; dkim=pass (2048-bit key) header.d=eduardovasconcelos.com header.i=@eduardovasconcelos.com header.b=VJyLhcqG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FYWTOEdI; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eduardovasconcelos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eduardovasconcelos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=eduardovasconcelos.com header.i=@eduardovasconcelos.com header.b="VJyLhcqG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FYWTOEdI"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 1056D1301122;
	Sat, 25 Apr 2026 02:40:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 25 Apr 2026 02:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	eduardovasconcelos.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm1; t=
	1777099231; x=1777102831; bh=jM0YA3PijrFLWpDOpFS8GNOBydZSVWDQ/sR
	GOPEIOPw=; b=VJyLhcqGcbDN9Avt/8NJDV+ebYjWy4JY9PVgpUHGwW3kBmd2KYP
	H8+MLJkjoCkAwyw/t1JV+dXpd8TzRjmuc5do7cTPSVf8i3YuYeXQy5FpUrDK/lz3
	XCTI2tw1toPSwwNZ7+QDeE+3CrzoG7VwsCL/Hmw6Arz0wbGeC1xjh9FOTqCgSl35
	+1QBhCiPQBpmdg2Qq9mPk8fE/lAKo+EtyoAEy3TEUHRatSj49h5rf1+trif7Kazr
	Ek7vtDUujh39OCHS8svqZuJoJuePE9Iwm6xkhHu/FydWF7vvDfpZ44qAzwIDpbMd
	+eztY5h2TLO/hKf7b0eLMcAL13wx8b1mFvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777099231; x=1777102831; bh=jM0YA3PijrFLWpDOpFS8GNOBydZSVWDQ/sR
	GOPEIOPw=; b=FYWTOEdIzwQFnzBC7C3w1PP/tBdaq/ybTVEihxb4eyvv0/chNpL
	u8s/6DvGBSj432gS8jt5Pvq2lNU+0ShJMt1duHMNF6wFd5+gZ4IMS0ML4D2nUA7m
	Vk6EVfIKXlcUpH5s6mpXJS47kgBA5TraziF/s7BWJeqG1EDZFgLcwd4IZGbhnWvU
	uPfvkxkwaPkX15yz1i2RyHTzSHevNjjAJDkQCkzxoLnjpJxRkLne6XD8mMrCEt97
	XxpdPsM2z1gU21YMzqcQ2euXlFjpILLxW+P2deJ3rfTAfH8Q3wtTlRFx29kCtTof
	nc9r3mWYndqCk33JEyEsxQiG8sylrad3kjg==
X-ME-Sender: <xms:3mHsaculTSfPmWyzmMP_xeekEJVTV4nX4w5cbue1S3tfkMjvgbmmjw>
    <xme:3mHsacj6nJC0ugrF-jxwfDsjM7kp9_fyaibVlnUytJ1du8PKIvFx9IdnZB_aKPu1R
    oRY15FQvOYtRKk5QmHjVudyaf2go_GdAQSYruu56uKOnUIliYJ7mQY>
X-ME-Received: <xmr:3mHsaSZPpJj3Sth6vKn4ycQ19F-phOLtHzsughJ9CulHTLw1czQMT_2xtKyftA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejvddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
    enucfhrhhomhepgfguuhgrrhguohcugggrshgtohhntggvlhhoshcuoegvughurghrugho
    segvughurghrughovhgrshgtohhntggvlhhoshdrtghomheqnecuggftrfgrthhtvghrnh
    epveffteffgeekteeljeefveekiefhffeuiedtkeekkeekvddugeejiedvueethfeinecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegvughurghrughosegvughurghrughovhgrshgtohhn
    tggvlhhoshdrtghomhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpd
    hrtghpthhtohepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdprhgt
    phhtthhopeguvghrvghkjhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpth
    htohephhhmhheshhhmhhdrvghnghdrsghrpdhrtghpthhtohephhgrnhhsgheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrih
    hnthgvlhdrtghomhdprhgtphhtthhopegvughurghrughosegvughurghrughovhgrshgt
    ohhntggvlhhoshdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqd
    igkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihgsmhdqrggtphhi
    qdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:3mHsabZOHGE98kNwP68nFtdsX_Eb-W_MebwK-ZThV3pY6uPLQqBXGQ>
    <xmx:3mHsaXxwTb8ZTy3FuQADJr3hYh9T80_lqQQdG7jyBXKgklWqm77hVA>
    <xmx:3mHsaXddygMS3K4K-tgijMqi4tzFzlFbpEc0XXMZWprg4z5a3ZEbGg>
    <xmx:3mHsac53UVJ9-DUDdC-hLMXk5grl9auCt9Jy-ALJkN0E4PIVDimfIQ>
    <xmx:32HsafJetZVbnlhjWDLmfDKy9ycCharhwT2rCsJBJmI4VhZ7odPCCWA5>
Feedback-ID: iac1e4b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Apr 2026 02:40:27 -0400 (EDT)
From: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Remove unneeded goto
Date: Sat, 25 Apr 2026 03:39:34 -0300
Message-ID: <20260425063936.9360-1-eduardo@eduardovasconcelos.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unneeded goto statement in hotkey_kthread(). Since
the function has a single exit location with no cleanup code,
the jump provides no benefit. Per the kernel coding style,
returning directly is preferred over goto in such case [1].

[1] https://www.kernel.org/doc/html/latest/process/coding-style.html

Signed-off-by: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
Tested-by: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com> (T420si)
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index e1cee42a1683..d4ed6f1216f2 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2469,7 +2469,7 @@ static int hotkey_kthread(void *data)
 	bool was_frozen;
 
 	if (tpacpi_lifecycle == TPACPI_LIFE_EXITING)
-		goto exit;
+		return 0;
 
 	set_freezable();
 
@@ -2526,7 +2526,6 @@ static int hotkey_kthread(void *data)
 		si ^= 1;
 	}
 
-exit:
 	return 0;
 }
 
-- 
2.54.0

