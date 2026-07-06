Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCA53F6C3B
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343623; cv=pass; b=ja3xv3Y7lXw78PZ5B3eRVK7pZXMOTKFaJdCKTifCu5pIa/d7CpHGqasSieayKSzDHAPBLxRlOShGUp5BFgacy91VEIiaAm+F717kIf5gZbTST2NaCnlRmeyOYUb7/SJ0NGFmRVb2bi0ER5WwK/pZ4hJeK3VBxIrXJTLT6U/BIhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343623; c=relaxed/simple;
	bh=5m7ktC4meBwANeVF13bNKF6VsxmZX1LV7CQf8EMXG4I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gjzw8M/XtN+X2nxx8YyFjbfdrsNqtUr/I3D+l0IPAWUvKiZmwJioyhJ6pn/aBJC9FW1lPJBXXx2eFOv5SBkzAxgDcx1LWEoexabp2pVucIBVhpkkm5kCm0dC5OkMM58SqEPi2l6eYftLdzr+96lihGZGD/fwTOKHoF34Xn9tG10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfsQiBsP; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfsQiBsP"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-806449d108aso43529767b3.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 06:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783343621; cv=none;
        d=google.com; s=arc-20260327;
        b=airFmHxbI+GyZZajyQrods5JRWlfG4WQDwHgTjk50Iu4IQ+dosa0xQDSDOYEpM0r2Z
         gcZ1xEzPhVuV40GSfK5LEGEBlGB4PUZGGVxDAU0WBTe8mntwiWbb0E3s+uEjAw3iRPYs
         H2KC4MzKI1A0LjCJ8VJ9tKnPzXar2owtxd4xrWzysEk8GuFpIN4ZFsDz3RPYOlAHgMz7
         bN93ZWE6WmtTXINo+gg9ED6l3/6BbS8ObHiNpFPQbEKEDMqSNxgTxQeda/PcHrQUoPFt
         N1qy694KoQ5Q+UIHZ1h6P2LiZmCP2MvE8DNrN8v3yGTeoAGwZF/gKi3SkBB4RZs3JD/4
         YRbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=FfhPm1S743xuqQ+Gf0fPtE2/F3TTG8jk6hQ6AV1fo2g=;
        fh=n09YQyfzFTVMQcL4NRXyK7BJTrV3MbfyhjU4ARsZl44=;
        b=rVHsudI0MfazviV/SsvRnc9UTuRQVFQlG+4JTWiB260ZKq5jRdsKJ7bfPaqCre83lA
         l3ll6p+a3GOzOgVux6RjTIuMP5HMLC1ATGzGTdVq4HRjk7X/NXv4RzSKMpu0yuebCkNu
         VCygRW41fhoaOBQ7TJWu0QHoyMcJPC6fynVn9Soyoj23Jdlcy8HYxaq5mFvDgkq6Bc9n
         jHnPzgv7TznymT1/xEuh8OyutjpY7fbj/Rw4sjSEIc46Z+K00Ocj57KDQ1dRe+UlBD87
         fWLKupGVqniiKHR6/S1pl6BcChKEFgIqe+PxKMCdKrKoXA/KqAjfEXJmPEJsQRk7Um4Z
         2IcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783343621; x=1783948421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FfhPm1S743xuqQ+Gf0fPtE2/F3TTG8jk6hQ6AV1fo2g=;
        b=BfsQiBsPEQuFEua/y2FipxhSf+YwyZ9fuuHVB+g09OVoBIY4eulzOgOLclXl2yeens
         a1VsDFUvmyovDG3P1McuYY2Cm6vhCPtD/tWueJaU+1UFmFqaHiMcfh4KGXQpQ/K6l4i4
         TlEN/PWO413unodS6hjkK8uONhI7NNs+e7kmYQPELgRlZyoOdGWrYuaLFiqox+Lm+8mD
         b/b5QXbGxvz7mRyzm+5XQ2xhLfwo0hgdscMhc05IJt79qaj6hfHrjr5pKg3z0wUXQVe7
         +3MIagMm8dqG0yELK++t2Obd677eFZLTNrIXdVk5YpfOdTHY+liiODiFuELSINxYl2fp
         xgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343621; x=1783948421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FfhPm1S743xuqQ+Gf0fPtE2/F3TTG8jk6hQ6AV1fo2g=;
        b=QDNK1IDqAj8BypZU1pdosfziCsGgG5NOgaITVrLCOCPPjlehWGVX0+VjQ6jut1Q/kF
         YwEGU/rd1QADSqHuvfRzHKahFUBAhSg3KF0yfWQUXVivjgtlOBLcPVhZTt7dKzyVwwpD
         y9n5ixAksgRZODvoF/ZX3PIkG/Lf/cUP4OhioRiQ6ejPJTSgPjM40V4uzBthvNK5YDWV
         bRDSGR+smktNwloODX2sCYL3puAqEzPgmYqeFcwsC4+SzowCCjQYeo9Ms5lqqeFfyIJs
         jlO8XP5WE/dM+yocwVuJV6xFr7EBg6VUOkUh9zL4Ovl7vH5dzsZMlK5jQ75zaP4fRk4c
         ri+g==
X-Forwarded-Encrypted: i=1; AHgh+RqAVL6RldCilVHp0Z/I6M6ACLZn9iweBBbwUpBiyobkAm/wSRBaOYl2b/TAtBHywQI2o5c6HbUjVLfbnNXf9Wm/BjLh@vger.kernel.org
X-Gm-Message-State: AOJu0YysQBzne+yEROpIbpp2d8w1gW+m+A+NMCfchJJ0t031Hhr6zO1m
	FJdfXgdTWg70Qm+UDglQeONOkvI36jpooiDvIRnJ40wU9ZBXjx3Qmp1he0AHciEpibc2bwj1Ko1
	Bgc9+vrF5KXkxvum+cXfc6+xvoCAPFI8=
X-Gm-Gg: AfdE7cmbjuQfmCEhkqY8B8o+/bL1+zgb2w7Nn6xJLKKrEteFfxxt2QeFniw16BxDT4f
	Wo0+Gk2xTxpmHTdK0lMi7c1b+we04lNbOpfWtwO8TJPp3oA+U6cGB2RerfdXPfR86wr3Q1aG8RZ
	T5vxC01dFXqRChhWDIDKIHu0ajhIDZNhI5nKu6broiiI6N6LNfnV8HTpXtRGi4mVt0qeyrOlyp4
	2qcS88LZNYM/nogrIfvY4PUR5B+JxgaocMRblMC4ddNen3G7O5a2vW+aLLjzscLQBbaSutm
X-Received: by 2002:a05:690c:c453:b0:7d1:dd7b:b734 with SMTP id
 00721157ae682-81be10411camr1627447b3.23.1783343620731; Mon, 06 Jul 2026
 06:13:40 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 6 Jul 2026 09:13:39 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 6 Jul 2026 09:13:39 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Mon, 6 Jul 2026 09:13:39 -0400
X-Gm-Features: AVVi8CccX5ycUCr_b0eitw-00dXUgfXPSzt6K6j8Xom7uxMF369TibNR_3ZKqAA
Message-ID: <CAMuQ4bUtJtYNTguKoiXngROJw0QQQcrvW3=3_B0-hpMQOFqvCQ@mail.gmail.com>
Subject: [PATCH v2] platform/x86/intel/vsec: free ACPI discovery data on early errors
To: david.e.box@linux.intel.com
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

intel_vsec_add_dev() may attach an ACPI discovery table copy to the
intel_vsec_device before passing ownership to intel_vsec_add_aux(). The
normal auxiliary-device release path frees that copy, but the earliest
intel_vsec_add_aux() failures free only the outer structure directly.

Route those direct frees through a common helper so acpi_disc is
released consistently on the parent, xarray, and ID allocation failure
paths.

Fixes: 22fa2ebc11a1 ("platform/x86/intel/vsec: Plumb ACPI PMT
discovery tables through vsec")

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
Changes in v2:
- Add the Fixes tag requested by Ilpo J=C3=A4rvinen.

 drivers/platform/x86/intel/vsec.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c
b/drivers/platform/x86/intel/vsec.c
index 3ae4557b32b4..5ab2215fdd7f 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -103,6 +103,12 @@ static void intel_vsec_remove_aux(void *data)
 	auxiliary_device_uninit(data);
 }

+static void intel_vsec_dev_free(struct intel_vsec_device *intel_vsec_dev)
+{
+	kfree(intel_vsec_dev->acpi_disc);
+	kfree(intel_vsec_dev);
+}
+
 static void intel_vsec_dev_release(struct device *dev)
 {
 	struct intel_vsec_device *intel_vsec_dev =3D dev_to_ivdev(dev);
@@ -111,8 +117,7 @@ static void intel_vsec_dev_release(struct device *dev)

 	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);

-	kfree(intel_vsec_dev->acpi_disc);
-	kfree(intel_vsec_dev);
+	intel_vsec_dev_free(intel_vsec_dev);
 }

 static const struct vsec_feature_dependency *
@@ -218,20 +223,22 @@ int intel_vsec_add_aux(struct device *parent,
 	struct auxiliary_device *auxdev =3D &intel_vsec_dev->auxdev;
 	int ret, id;

-	if (!parent)
+	if (!parent) {
+		intel_vsec_dev_free(intel_vsec_dev);
 		return -EINVAL;
+	}

 	ret =3D xa_alloc(&auxdev_array, &intel_vsec_dev->id, intel_vsec_dev,
 		       PMT_XA_LIMIT, GFP_KERNEL);
 	if (ret < 0) {
-		kfree(intel_vsec_dev);
+		intel_vsec_dev_free(intel_vsec_dev);
 		return ret;
 	}

 	id =3D ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
 	if (id < 0) {
 		xa_erase(&auxdev_array, intel_vsec_dev->id);
-		kfree(intel_vsec_dev);
+		intel_vsec_dev_free(intel_vsec_dev);
 		return id;
 	}

--=20
2.55.0
