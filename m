Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E2338E8AB
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 17:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784482660; cv=none; b=EC4bU0T1/GMsNUw1lj0YIiIMEnwzj69YPpKNmv4gZnM8OhSX1jqY9rkGJRt57jAL/ec3sBZv5K3i5iEPJr9KOKbGpRyCPhaETqXExIQxDCaDq5e2rry98zuyDolhWub5em7PvcI0/jMLoAxV9XeAIXAtA6amKdmYAGRhZOkCFvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784482660; c=relaxed/simple;
	bh=nJZwVCxqbkHts6zj0Ud6xkhvo2+8qpTec7hN7/2JIm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAo/2JrO/kJLZwzJCSqs7cRmaGC8qONgfrfTmBD0XxxryNymrbD8png+J282bobHksB6lp50bmswNfy9ghuRSFI56Ux5m1+OydnIJnw1xqbnj2FxbMqYzsOJWV5QS20PnsKJEbRnFmjS9sQFPXXitKrFQQG50WpaSAaVi9rLUcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=ofrOkRvQ; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="ofrOkRvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1785087458; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	References:MIME-Version:Content-Transfer-Encoding:Feedback-Id;
	bh=XFKzPGmEJ3BPxQewhHFUIelVcZFAAKsxrifnQBu0zL8=; b=ofrOkRvQcpDMw
	UNXjwhazyP8MlYXVNdMtLS27HAbSu18sdg4n+oeQcVSgIvQEV1THn0l52FBraOY3
	YFfDkCrmIl+DXM68rAMRfKHgwRXhq899vhB8Jwr/GBGj0zDsaz7B57SVzNZk1xFh
	LVtzjjZ9TSYbLo1PpEAyW97ohTB7W4=
Received: (qmail 4055508 invoked from network); 19 Jul 2026 17:37:31 -0000
Received: from 197.145.178.94  by turbo-smtp.com with SMTP; 19 Jul 2026 17:37:30 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e6511786d82c003-003-4288be1d
From: Yahya Toubali <yahya@yahyatoubali.me>
To: corbet@lwn.net, mpearson-lenovo@squebb.ca
Cc: linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, yahya@yahyatoubali.me
Subject: [PATCH] Documentation: wmi: lenovo-wmi-other: Document intentional BIOS misspelling
Date: Sun, 19 Jul 2026 18:37:10 +0100
Message-ID: <20260719173710.2367930-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87v7ab3p2p.fsf@trenco.lwn.net>
References: <87v7ab3p2p.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

The spelling "Minumum" in the FanMinSpeed entry is intentionally kept
as-is because it reflects the actual string returned by the system BIOS.
Add an explanatory note to prevent future redundant spelling-fix submissions.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>

Thanks Mark and Jon for the context.

That makes total sense. I dropped the housekeeping typo fix for now to avoid
unnecessary churn, and this v4 keeps the BIOS spelling but adds the explicit
note documenting the firmware quirk as suggested.

---
 Documentation/wmi/devices/lenovo-wmi-other.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 01d471156738..f6760f0a6260 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -90,6 +90,10 @@ WMI interface description
 The WMI interface description can be decoded from the embedded binary MOF (bmof)
 data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
 
+.. note::
+   The misspelling of "Minumum" in the FanMinSpeed entry below is deliberate
+   and reflects the actual string embedded within the system BIOS.
+
 ::
 
   [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO_OTHER_METHOD class"), guid("{dc2a8805-3a8c-41ba-a6f7-092e0089cd3b}")]
-- 
2.55.0


