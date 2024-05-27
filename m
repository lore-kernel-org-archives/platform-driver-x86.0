Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059B43AB5
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801295; cv=none; b=GqTNNcVkBB4AyDBjeJHLhRm0RGQ2H7lsro9jdqKG+MGDBBtEGSvSNPxNUaAI53CngV45wI/YLvuFgQEyBs5Q80xIE7Qp0/IxVEBzfYxv0picPEC4vn8QUorg2Zsl9bpcldfrKtkQiEHWGw4ZDC1p53cid/egH5bg3Gm34qkXkNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801295; c=relaxed/simple;
	bh=1z2no8StgzVGGnV6C6aSGdBmKSK3suD1rMiUnEKuG2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nn/raI5a0bqAXanordR99GhQ86vnVeDZWKoNcDNpcIH3dASr3yh57EAWixUhjlDxyHZLGIodBA9/CuUzq593vH8rII0SgOtYcKm9QM3wcEgOuNERAtoxA3y2NtLJ19ttQJ0wvL9jfn5a3x1OLVTfDze+ObLJ8i82sud8WRhIO1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K7IHWhGQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K7IHWhGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716801292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uSj0gdyGiw5TQ5HRd6fk93ri8OoyhGUAyJwEumiDZUk=;
	b=K7IHWhGQ3AjFqlKsvAn2npYN1ZAyuDw/RLdR7Ikf7KVktCo/IA1lTw2Uh/oOY3/jQSfFM6
	E8k/gkQLw5Cgg5hKocMnddzZGukOFC+AencWihW2yD8tYJe/n6AjxSToGlwaEuGzbwXKqA
	6CHVwCWKc/2IAxCOVX9t60Y66UuenT8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-vp27xulaOfaeAbNkk0q2FA-1; Mon, 27 May 2024 05:14:49 -0400
X-MC-Unique: vp27xulaOfaeAbNkk0q2FA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9537E8058D1;
	Mon, 27 May 2024 09:14:49 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 819F3200A381;
	Mon, 27 May 2024 09:14:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	hmtheboy154 <buingoc67@gmail.com>,
	Gregor Riepl <onitake@gmail.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: touchscreen_dmi: Add info for 2 new models
Date: Mon, 27 May 2024 11:14:45 +0200
Message-ID: <20240527091447.248849-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Hi All,

This series adds touchscreen parameters for 2 new models to
touchscreen_dmi.c . The parameters for these 2 new models have been
found by using the new "i2c_touchscreen_props=..." kernel commandline
argument.

These 2 patches have been cherry-picked from:

https://github.com/android-generic/kernel_common/

which already as the "i2c_touchscreen_props=..." support merged.

Regards,

Hans


hmtheboy154 (2):
  platform/x86: touchscreen_dmi: Add info for GlobalSpace SolT IVW 11.6"
    tablet
  platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro

 drivers/platform/x86/touchscreen_dmi.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

-- 
2.45.1

