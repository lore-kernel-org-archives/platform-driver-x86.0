Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B2F3AB28D
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 22:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790375153; cv=pass; b=JfseuFu5BDtMHDV63P6m1U5rMQ+N5032XhgXeYwPhTrH6zUNW1AOO6btjQuPYwcXYJg7lckSbkREr6N7sKJujoNngc7irILmLx5/LlJtElQFFq1IZE0NWP/xOfqzT/bwtWR7ZsvBvpk0sYjC0C5IPXMYuCgYkk2F3RiZqZUqeNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790375153; c=relaxed/simple;
	bh=rPZBW/5jkrGv9NMMpR/lKFOq4tafudnJki38l5ePlAM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=o4HU/uNDvL/DhjqWRMGjVSdyOHCLXE55+g/t/mRZV5dR4gYOTAxaj5fZRouyUom9Qokjc3il3S7W6nvMyJBVuQbWeV7TK7iN0mqso3EH7KFTg+NVmpjvasFLNIgeMcLaeuWKcYJupF5s6wxLu/TmyEfuSB/erJ9Z3Eeb6RJEAAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMAr5ciB; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMAr5ciB"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so74047766b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 15:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790375150; cv=none;
        d=google.com; s=arc-20260327;
        b=lwdkTsZ1lfmADG5tGcR6lAX9N4wzve4FNSotJ2Yb612hjoOJBMz6nNABTqGI4KqBBd
         SbGHA/KszyJY6KlzRt2ccomLPU6XZTuquKHEI6qaYwfUsqXwKI5tqZr7dXnIeZJideCv
         xAvlnu/FcycJ0+GefqIdTv+EfyDAHAUju+vZi3W/i4QqzWLYr4iFy/GtMeq1Fv8av7FM
         Wg1ocggiOtFwCnyMlX1EeICo8/TVRHXZtiygHyHkNqP4V1yRC9ebmEB/SeqNBHbi72aM
         TiKtTwPdkB+MsDB+Z8QH0fuuk8TaSA7kyRzv79JQkDdjHD1AKdokyGGImgzjMwVb62gs
         GvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qWiDrsyEMm+5QyTN9fxVE2TJRCbEHIl6rs5RVDCoIDg=;
        fh=sSjoUrTV3k59Bct73YzUcAaweKB1F+oXjfV5M6SaGzA=;
        b=BJiz7QS6m+t7y//HdOdFR2a0c0m/nGiZ74Atibu2UuFWWhIi0d5VKVwVONLBgbNQss
         E3d3Br2e0xKM/PxtfU9hlFSUq5qA8wE5jQpCt7xHqwE3oDFbPYdCdaP28Vp3uLl9qOvb
         mCnZ5W38jGiGaz+gEi1bjDB6WNeio1hIawACUey5qC9SzyqhUfgFEuaZ9eEVG1wM/c6A
         LKME9hOQ3WD4+qcg3eHGqIkYARgZLhcxyrrGB8k2+0tIG//ahKcZCOv+TuY4CA9QV+sP
         yT3mwMNGzIYUr/2hRhRgx9mOHB3poGLO0Nd6Ga1nOZ5Ljh6L3BGbF9nsjuPVA1KIez6Y
         Wm2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790375150; x=1790979950; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qWiDrsyEMm+5QyTN9fxVE2TJRCbEHIl6rs5RVDCoIDg=;
        b=aMAr5ciBpNyE3PWpxoU/oQ6CXZ111Y522d2/DPHwqZ7/2wlylU4e2lZmGYxX+bEJcg
         75Jw3M5NCOxxGnmjZQqxKn1qXuAGToFViQ9VkNB3iwOvoKL9293q1AKQIRTnzj/jKT4I
         faPAGEAWg00a5yzi0cY9cMq1hxaMZensmeOHy59ilbxExmvfBxH+cljbHmNcMw+18yE0
         FbgIOkECDGVOgu249sil6jUMrVVXcz/HoqEmA7bXOdz9xn+tQcZ7r0qPoTMihv4oI2Ug
         F6Y+1OQvL8V1a1nw5MuHRPosGBU2N7XmYAIlHG1wVLlVYOL3c+oj0HeTv1gJpbmSt32Y
         rPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790375150; x=1790979950;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qWiDrsyEMm+5QyTN9fxVE2TJRCbEHIl6rs5RVDCoIDg=;
        b=CoI58itJzjbCIWs3GeRSZZEeR35tn+WNtyxdNqbpVJ5ztk628dp01pEomr4DorL+LV
         Sb9bkRlyLGDTYhv9+nbTY+GPJk+YWfiJg8pIZyj4/9lnTyDzUckxccmPHxhpkHkAr9CE
         RSsm2b85XVYpVgNUqQBueqrqxZRfas60KTkurIqT2CgckoosmlNSKC9ETtGQc+vsLTnG
         Vblq7IfjU/0W8rTtbjX30A3RscFXRP3hR5c+EAsc5FsQ5VVrEmSejoqrZU2A6CsZ54pI
         /iA9ED49RCqhZXtHx7WOCBnPhAwwBc/A+N+SLgTn6E9mScfVjK5gaiJakIgu5sZU/Z1w
         SLKA==
X-Gm-Message-State: AFuF++lD5iBd42Eh97/F/j9dl6/ztikRjeDbgq1uy8FLbSI+1uks/3Q4
	efjD0NaSh/tyn1hJV0fXKvbdAfyoTzgoc/BqUUykXhRSYahp0bQ322kwWH4GwfEKjQBA5sn1rZU
	lXaqmaJkZr7SdlxW0MUslKWShf2TmXV25Mg==
X-Gm-Gg: AYBFou2N/nU2691N5U9ig/OCso1oWSoTGjpnPV3Poymd6IqmiSXZQ67YFrKNKnGLTLB
	rmkFfOwB1k36fr1SRGQ6ein6lBYGihujys8PSDMD66K8C3YpB7baVNE+wec3iybZZeaUtK5vh0A
	5XK2KV3WpgUHwY/QaBTOUxNZRY15QR+VJ4NamJ24Sr+9GJRJS9ebMDXLpKKIZ84wh21mtRxcQtV
	4ctlQLfEuWb+9vN8h4TIAoug4GibIUFppyamVCiw4NigHAUGfIMJHKLPtBk1P9PvjDxGfdxaZQV
	papR2dxfkD052TNOXDz/BuHuPJZj7ADt7ZMEgqI9bXxti/A/D8jnfP4IgKXifh9qtvGbKgFUGDI
	gb7DkC+zkEXWFL9chOJ5rCIK38y3QU/h3ohTmPMJMGK0dPhg=
X-Received: by 2002:a17:907:960b:b0:c29:3d59:7072 with SMTP id
 a640c23a62f3a-c2ac23b58bbmr622944566b.16.1790375150034; Fri, 25 Sep 2026
 15:25:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?0JDQvdGC0L7QvSDQmtCw0YDQsNGB0LXQsg==?= <uselessfire@gmail.com>
Date: Sat, 26 Sep 2026 01:25:13 +0300
X-Gm-Features: AclHuK-Zzo-b9ZF2HA_2mYxIqgaZ0ntj55xPxhdSwzxPxFoITQIBoGaC-WUC5mM
Message-ID: <CAFsq4KBXCB=aK8ENHx__6+RcC-ybT7eKjcgsa3TgcJ54x-PLEg@mail.gmail.com>
Subject: redmi-wmi: display-switch key (F7) dropped on Redmi Book Pro 16 2024
 (payload 0x101 missing from keymap)
To: foxido@foxido.dev
Cc: platform-driver-x86@vger.kernel.org, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On a Xiaomi Redmi Book Pro 16 2024 (DMI: XIAOMI / TM2309, BIOS RMAMT6B0P0B0B)
the display-switch key (F7) produces no input event at all, while every other
hotkey on the same device works.

The firmware on this model emits payload 0x00000101 for that key, while
redmi_wmi_keymap only contains the long form 0x00010101, so
sparse_keymap_entry_from_scancode() returns NULL and the event is dropped:

  redmi-wmi 46C93E13-...-0: Unknown WMI event with payload 257

Verified with a kprobe on sparse_keymap_entry_from_scancode(): pressing F7
gives payload=0x101 and no subsequent call to sparse_keymap_report_entry().
The keymap already carries both the short and the long form for the settings
key (0x00001b01 and 0x00011b01); the display-switch key only has the long one.

Suggested fix:

   {KE_KEY, 0x00010101, {KEY_SWITCHVIDEOMODE}},
 + /* Redmi Book Pro 16 2024 sends the short form */
 + {KE_KEY, 0x00000101, {KEY_SWITCHVIDEOMODE}},

Two further observations are in the bug report: unhandled payloads 0x00000901 /
0x00010901 (the EC echoing back the Caps Lock LED state the host itself set --
candidates for KE_IGNORE), and the keyboard-backlight comment "Off / Auto /
Low / High" being wrong for this model (0x80 is "always on", the BIOS timeout
is what 0x05 and 0x0a do).

Full report with traces and the exact verification steps:
https://bugzilla.kernel.org/show_bug.cgi?id=222062

Tested on 7.2.2, 7.2.6 and 7.2.7; the keymap in mainline is unchanged as of
2026-09-26.
