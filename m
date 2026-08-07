Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84A833938E
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Aug 2026 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113643; cv=none; b=NRgAAjW8GNg8edi4Ko97I8LCtWtc3ozq6+oc3BYHmGkVHqod51S9HCB8XlXlTATzyeNxnErz7v6Zlb1HpBZVaioD4HimAvDD/30rhu7+Dvx+lpm80cD5QqBXiuHoQAeCpppisUH+Tt1hzDc84DnVPQzwquZYTurQEZAlDtLTrbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113643; c=relaxed/simple;
	bh=kTpWap4f0tmKu5jxywAQC5fOl8GUMZlIbJrYXMIdpcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPUgSlU6DiTIB7iXRRIIMHvZEdTtkh+0seQV716M9c78vthUw1xMuZNrlWnDvzxgVwgjINTBxckg6PVQVB3eHhWUxaCVm1qSko14ncsuShEsjotkBXJKuPpPolLOJhFm2wg7JpU/t5f6ybOz+4OTnXmDp4qq+Ehl/93mSCzP9Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLmqKQgM; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLmqKQgM"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4285598a91.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Aug 2026 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786113628; x=1786718428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQFVxxu807wdaX5Bwa/NPTU2e5DLee4RPhU/5SIwcTA=;
        b=HLmqKQgM+6B1/TSaLEFoDk1epmccWR6ofFU44i96WA/IGi+YsWWF/PyOPjGDT9OuOg
         ApuQqcd1x0vjTZk0uwJqrXliuAcf+TE5ljyTXoeeytC56zXlNBR7jYeLc/A89xOwTmGh
         mGAkhbawdWfCFfw4d/yZK1KKSw7/Q2/Ts2QJGRMDgcDAtr2nh5KtM33t4LBF0dJ8f3Hv
         DZwycynEyOGNQEcx+KIwSaDQ88ra/zY6xoQU591ttaDF6lKoWEOo+EDhGxoJLY0aJyZX
         S9IvQaaRp3DUGJVMa40kx6HWyhnRYshE6TsMA8KKUQo4nVxrInwQ3jY3h8Tj7u82hI4M
         NXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786113628; x=1786718428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQFVxxu807wdaX5Bwa/NPTU2e5DLee4RPhU/5SIwcTA=;
        b=foKu+RGK3wnc1kUVMkqQ85TUf4AjWM91nNDk4J9VaQFSZ8DLoFXgBq/SQVasvRY96K
         +IV3kcFm80QC+tzvEfN5aZsFSh4LSWqmY8FPV/DyguIOT7tkEotNZVgj+jkm4Z/riOyH
         hrTbBMwGF161BFDoXF+b6ik0Al6aMw6j8coS7s7jK+Ih2e3b0vXnqK1lvLubjtNbM3ly
         DGymaQif7oddc3EikpzxsN9RkS5+0HF3TDCVHoWqoQc2p3POYfSMZDb05qgZxA0v+fz2
         iaiIJ0q/SjvD0UHdlzdN2gtP2qX4lgnodbkfKkFLvmi0nfnlwePQmUQXIU6NugeSnDTo
         HmEQ==
X-Gm-Message-State: AOJu0Yx/4WK9cFic04WnMnbiW5krh7HarV3O0szAMGO7O8Et998yyn6M
	tuj/8EiPBRlNn1SSleaococS9/6KTgQCvC87mzNiKdxn1pbJcPCtsKrl
X-Gm-Gg: AR+sD12c58oi8s2NJKjJYMfH1wysEe69bVdcuh6tCFRWQUfJkYlVVTjzB6fiQC1wWZR
	TdLKmTwjqU7tbUpsKaqJYqrx1Oz8835A1aHJHq4OUIOxRrQCclIujmwjg5O0YThR7vANmIE5aiB
	vDc5JaGUH2RprgkOhl4+Ye3zTnMQPBh4PCPTbYWpCKxdhMtjjW4cWi/cLLkzG2/XmU+LOolP8OX
	2wWfTgbwlqwNazq5UllNGuKJL+7RC2CftZJduz03N3v6sCvSVFY99TjlPHg5KwUaMNBW9p8xb1e
	mUJatiUBOcRoapocIWJIjtoBv2f3NEWCRxDQru66mnMRwY7C4dZJd7v/oBzttuSRlaHqLs/gkjk
	WzaX5bzZe79LWqXlwQ2mDhaB1Xg8TJeZ0O/jCsgTCbdSsPvsn6t8S4uDiEoQuAGrIJAA7oFWJP+
	aR7FDDu+To8SRraXK1r7ItSmbbJrsjPOt0DM+9KFw8bNgaaXiil0vrd1XPkTo/vq9ZokrBKa+gM
	4aGM7vp5zhJFdEW00ZqJoUhNexSaabdLoMFfzt7XVSxdcKCsS84yg==
X-Received: by 2002:a17:90b:590d:b0:38f:5801:cd76 with SMTP id 98e67ed59e1d1-39261f71c4cmr5047859a91.3.1786113628037;
        Fri, 07 Aug 2026 07:40:28 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925ff24b91sm2917026a91.9.2026.08.07.07.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:40:27 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/2] platform/x86: ISST: Two ioctl input validation fixes
Date: Fri,  7 Aug 2026 23:40:01 +0900
Message-ID: <20260807144003.3498972-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two out-of-bounds accesses reachable from the ISST character device
ioctls, both from user-supplied index values that are not bounded before
use.

The first is an off-by-one on socket_id in the CLOS association ioctl,
plus a missing NULL check on the resulting instance pointer. The same
file already gets both of these right in get_instance(), which rejects
pkg_id with in_range(pkg_id, 0, topology_max_packages()) and then checks
the instance for NULL before returning it.

The second is a missing level bound in the two perf-mask ioctls. The
four adjacent helpers that read the same per-level register block all
reject a level above max_level first.

Neither path is behind CAP_SYS_ADMIN. Commit 69cd1ca440a9 ("platform/x86:
ISST: Check for admin capability for write commands") describes
deployments that relax the permissions on /dev/isst_interface so that
non-root users can read SST capabilities, and deliberately gates only the
write commands.

Found by inspection, not reproduced on hardware.

HyeongJun An (2):
  platform/x86: ISST: Validate socket ID in clos_assoc ioctl
  platform/x86: ISST: Validate level in perf mask ioctls

 .../x86/intel/speed_select_if/isst_tpmi_core.c      | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.43.0

