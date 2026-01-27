Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA88C2F6168
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jan 2026 23:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769557977; cv=pass; b=AUq2KdUoGnJ8P4H91SP35u4fNmANAmj3W8As9CKsP6R8wFyJS4gztvMbnnl17Y6tNYLuhx30d0MSHVNYibBGIEFYugg8ekQ0KavEe9iGB68JQGXaXDnCQQEnjhTsBFTfO6IM36lcTA2YonDbsYHilxrfiTP7/KDCchp8+WH9BQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769557977; c=relaxed/simple;
	bh=wP+T1mrJ9Y7wHNPsBx6lrLracBB4b6pojwO7ayTs7IE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lKALrdjbsBPO29QFhLYGys90U+gWcaAbV7nqnVxDqmKWliMnJNuevLr92Ll+zvLc1JV72MUNSz+6gDsgcH3p/IMu+auCE+vjjLcKnyOidMErX3pkruL3RCHPNUySC0oZUPAeggKzRn7uQreUo8alttl19iydNFnkJmIuUchhhg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqA4aCUs; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqA4aCUs"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78fc3572431so63202547b3.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jan 2026 15:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769557975; cv=none;
        d=google.com; s=arc-20240605;
        b=e6P8Lov3lXx9WBHurygDxsuGFMAHnSl45yaHW+26pUpSrmSUoZijltDbNgX0QbD5tv
         G0r0LegQ9zW0sqSUrBj9rG38HyOzwwWgQFgpNKRrFJBiyeBSgKgzh6mg3TMXioJSH3VD
         eekXCmWMctQfoNwJ0XpkKko03yGBxYDs0Xdr8d0B/JB3+O7DcwoPv7pSbTXqiTJKTpVB
         7RXaxdp07Krrs4c4bJpoRUo37iWa7/gQCDqoxkCRB/xbYzAykp73Uh8UfUBNRr6Hciik
         5K/ECb5RSk++YovKU361+GTL5pd5A/Wu0vBXRQfaoC7ud0aPkXfqtp9OhPsZ+8oIMS1Y
         gG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4hZFbjAUTcnlL9BzLkg4XJcE2dojo8YnRxn3ziL51LI=;
        fh=1jKM9RJey5aDo0MIk7/puizFMt96EWZRXkegpK5HZuY=;
        b=HKq9R0OF2qiv9Dd6eL39rHKnuPCxDnPNkCTcDtuLnIvlhqAYCjDKPu6xNowWq5vd9O
         xV1pTuWdtDOBDRuqaIE5ooRdviFYI7w0wiYBcHSHLXnKOyhiiZPsS+n95pje/zsXlE3p
         sT3frxAw4AmqTunPIyYiTTB+3zMgJI+SKKnLkFMAnVEK+Vtbi9YtvGhLjMpKPiNgE5Jn
         BvRy/gsqUldiOqN1o7OvEXYDyv+qlFVGtma+LgClMy6jRboL8zQIC882Sfs1ABy0t9ST
         SDS/IMWd+tEUKbRKwBrvACX5lAvLgKVHf1HExBB0AWtfTSr9cefGfXPjWoKoGkRXZA5w
         6HDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769557975; x=1770162775; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4hZFbjAUTcnlL9BzLkg4XJcE2dojo8YnRxn3ziL51LI=;
        b=fqA4aCUsfktE2syikPpx9zUOQWClImyt5Y9CWv58Qrxvs9sBBGI1R8oZfe146XP0za
         fgJZzOV42Um8bdGF1WrR56BhWYZd2KiiuSkW96OjjCLjsmnk/f5UiBN2q/Z+0V8m2+eE
         VZQvURbA37BEkF4KpNRU60DIad81pJXMsffpjjUstvKMhilt4ANIgzGJD89RUDAb7izt
         97AgykBkZxL9SwEABgFKDfsYYl7MFWoDaDpE1XwIhlepx007BbltSb9mSRggOQLH06KE
         dRAeEhjyVGGsKR8o6ueTP6KZpnDB1p/4DGPYpnY1ABCU0AEn0z2HdrbDD6CjPkFX5Tc9
         cFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769557975; x=1770162775;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hZFbjAUTcnlL9BzLkg4XJcE2dojo8YnRxn3ziL51LI=;
        b=bdJYbjv+08Lg/C98j47BfviFABXtx8V5QZF+V7/CMAqzoSJ7P0AYt3h8YUK7264xMl
         AeFLJ7w/mztVghzUvjWtut5BDY+sayDIJRmKk0vxPovyMrNjW4MfYJ/Mno/U1ZtAWUdj
         OplcPncZqfqi38YgyIO00Xw6dupCOkt9HtV6f1ijKh1GrgtIZ8WlS3K1S1DE6XUv6gJa
         vYE6sY+MlBMzC9f9ZJSCYU3iqWlNI0JXik8ub7yKESraksYFnLHE0gczexxnEb2UXxbt
         YrqlWCTDXa0wkMt6ChKkjH+mvQi0djEF34FVGYkg+nNvvtQuMRrDsf4P2Lv5gGOdVc2m
         1GAw==
X-Gm-Message-State: AOJu0YzRPo0oMDrgJtwL0+XcKvKajjxl88gd9sdU3l6cESyDKIiGA0IA
	NF61c77Gb6ewORq7cr9ezZ3UNPRgU5nQKgU47LWHm+XnunAIc3hN5LsXLsOWXgB8WwQfPBkDG/o
	uPDhIcwbhjmpRLAbYDbkrKoQBBzERPv63y/oc
X-Gm-Gg: AZuq6aLGLluRkKuzZ1YCuRtHOVHxM6LuLVs72+IRC6LQkgBhbO9tE8bWJ3o3YTG56ds
	Um1mEc9NK8F/ICe+X8qfh8jhCUlhWtaM+2YI21iLh/A+nXBPxFYT0kA5TmsLOBHJxkdbiw1/3Fa
	qzoS/vAkODKFve5ptvNLApfor722lXtRIMY5pcWvyU6c6ApTxyTiZsReF3i3u9E5DB6/Odgiuy8
	1l8JV57xqWnhMQx5e7qf2e2AcRDznGimIE9WdCfUoxXsG5mH3fk32jcwJ5QiBAMBx9fjetBHHyf
	90lyUg==
X-Received: by 2002:a05:690c:d82:b0:786:91ac:e15d with SMTP id
 00721157ae682-7947ab426cfmr24206557b3.27.1769557975338; Tue, 27 Jan 2026
 15:52:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?UmFmYcWCIMW7dWNobmlr?= <rafal.zuchnik@gmail.com>
Date: Wed, 28 Jan 2026 00:52:44 +0100
X-Gm-Features: AZwV_QhEYDkIsAeZZKGkJNpc21zHmMkzGzYFASsqCw0gt5UYwXGVt9abpqrvb6A
Message-ID: <CAJ10sVKe+kV3erD-cYREV0g=r6biKm+OatPJFHncnyrYDp8wiQ@mail.gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: add DMI match for ARC 11.6
 128GB HD
To: platform-driver-x86@vger.kernel.org
Cc: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This device is identical to Techbite Arc 11.6, but ships with a different
DMI_PRODUCT_NAME ("ARC 11.6 128GB HD").

Without this DMI match, the Silead touchscreen reports an incorrect coordinate
range, resulting in partial and wrapped touch input under Wayland.

Reuse the existing techbite_arc_11_6_data for this model.

Signed-off-by: Rafal Zuchnik <rafal.zuchnik@gmail.com>

---
diff --git a/drivers/platform/x86/touchscreen_dmi.c
b/drivers/platform/x86/touchscreen_dmi.c
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@
     {
         .matches = {
             DMI_MATCH(DMI_SYS_VENDOR, "mPTech"),
             DMI_MATCH(DMI_PRODUCT_NAME, "techBite Arc 11.6"),
             DMI_MATCH(DMI_BOARD_NAME, "G8316_272B"),
         },
         .driver_data = (void *)&techbite_arc_11_6_data,
     },
+    {
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "mPTech"),
+            DMI_MATCH(DMI_PRODUCT_NAME, "ARC 11.6 128GB HD"),
+        },
+        .driver_data = (void *)&techbite_arc_11_6_data,
+    },
 };
