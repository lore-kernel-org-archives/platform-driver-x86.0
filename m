Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C5D279329
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 13:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270766; cv=none; b=uwrMQYlekD9gqhxQHDhYW5dE4txFD55Q7dYI+n91JaqS/vwarKE5+K+8J/YhgwSGDFwrzbmi2lrlayUcKKOLzK4gVwzyZ6N6uKZExSg2XEsg5HcVuHpozvc68iXdXUmnXlo3b3KXP5TjZTk99N/35+G5kuADu2bvwOabZTh7Ng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270766; c=relaxed/simple;
	bh=RnJEcgLFm9GMsXQ1pf8UCusZiOE1RhcKErNJIDA4qXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BScA2IXlLUBVJHN/BDuHuUbWkyJ6c6m7lm/iuIXIMQRp5Xr/mmNA6TSDjevYCrFEYN67rT7tLJ6VqPWNHDs5lxsXSYlDoswqrmUPtqszjUd8FI8cHxFWcR/R8+zMEMnqijtsPBKD7d1Fw+9hRusvAqun2oJijRPH3AN7htCZ/Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gssJCOWY; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gssJCOWY"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8ce65629acaso11921706d6.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270764; x=1781875564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=797WabJnKHoJ/Ohz0lsUCKIWmtQdEF5JofxeEnnO+5I=;
        b=gssJCOWYc7VSajOf2a0qVlZ6MmAeBwjf4B79+mZzNMPrTnlmbPWxzSoefnnvda7NBN
         AGaW81YWDy6KM+6qZDJMgn0TQNNQVnRLGZm2yxNQMxkZj0g2G3Fcq45DaAYZIGdhLr4N
         5XMXGSxCUL7nagoEnt1isUGO9CCUNucJRpi3zHdcuA27/sGmwtRU3btSs3HC6OM25jjJ
         mEhgNyvQDRobHTmHG5G2Ygu+lDvWqBiPOm9OkSlNs5OBrsv7LscsEhjjtWQTbEdZRq7x
         Jp3cf2KJ+ZXLkrACEc2ge+2h6nunjrwwq2UQNX/pQFrzYNIeP5Hk6io3xcz5ynLjTf7S
         fPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270764; x=1781875564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=797WabJnKHoJ/Ohz0lsUCKIWmtQdEF5JofxeEnnO+5I=;
        b=j2TnYSWgKaKNGwVn6+12rMw+Xta+jZZG9DtgGCfNSPSiDpAfttzAZcKqVRrqyGZi3U
         Praku+791EmqdSEPvRAuCBiKWmsXxA214hgJx+lJIq8yzSzvPIRwdRHxUQzFYkWe85Cx
         5mcOvqFKHPuayg5dm+mlT/htYGUgmvK0bRlZB7yrRXj7h6QEZ2Tf1Mgflae/flqBXiIl
         1rMPXxOI6mgt2nC5jSRp2cDMpPHEf2rOttW6P7WmK/50nxcu9bZ0V2QCC/aqxZ5+tQhT
         qXHRFrPsPqzHpGH4wSwVcxzCEdMuBGJC2HxfrXPIdb1lrXzzyGqNTra9o1drbWJDZd0o
         ynhw==
X-Forwarded-Encrypted: i=1; AFNElJ/v/MZK0vJ0BHBc7nkGdibqm7KwMuboJT8Cdv7lZ1T5bGgkIyPMidlIO0ia6fMVude2dO0lrJjA3YT4v4TQ9a8Yct+Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyurEpB6ZfA3dqyEMxuXWmdlXluHKV0cUwr3c5XPcOsx5U1qTWS
	0tf9GkqbQcHYURydmemUCiok6XBmlMM+DgGsrOppk6TsggLxzHxcfTp9
X-Gm-Gg: Acq92OGnUj5xxB4Lg2CqGEG+eO27zT0uQS9bOjxq4xUZazDCPxTLe+0PNeUPxZMKKnV
	pd6ulki7DWgwSM2Y5fR6jcXQqGOgmIeZDaTqqgA5ThQ3q+Wf66N64saS5mntAwy0ZqHpPaHTfJX
	rFXKEMYl+dKiv4Y58v+0hL4fGRYl8a7Da8DBMPeXUvESJj9t11NpegDIwJTFBSuSDvRvID6pmXF
	h0Dr3GA/FU9MU3eo40l5NUOPHwuucMqWTnOCQPhlRTgfKIwoKgyxBklwhwmKdWudyBFTLq6WHNm
	AKw4C6qaHedh9BQnD0gcUQZOVZ3yDTtORqDRQDhuZ/MfQz/N36Kw7K04pyoSpv3ct7rX7sTBlTU
	LbVyXt5tfb+oUXL9rfQXHbw1yZl4dinoqWntXH3Z8YHCaKq/1iAk1WcYjHYal+IHVVbV3GUBkxv
	wSyG3AOb2GhkoEh0jmcF+hEw==
X-Received: by 2002:a05:6214:3387:b0:8ca:2675:8abf with SMTP id 6a1803df08f44-8d32c4e9c83mr50070296d6.18.1781270764402;
        Fri, 12 Jun 2026 06:26:04 -0700 (PDT)
Received: from fedora ([2600:382:2f05:f952:c6ec:c2a9:e0ed:4e6a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30513776asm22963526d6.41.2026.06.12.06.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:26:03 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	Hans de Goede <hansg@kernel.org>,
	Dave Carey <carvsdriver@gmail.com>
Subject: Re: [PATCH v8 2/2] platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver
Date: Fri, 12 Jun 2026 09:25:56 -0400
Message-ID: <20260612132556.351400-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <e13e6d83-8796-48de-b3dc-97843d91c24b@gmx.de>
References: <e13e6d83-8796-48de-b3dc-97843d91c24b@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 10 Jun 2026 19:59:53 +0200, Armin Wolf wrote:
> how many instances of the LENOVO_FEATURE_STATUS_DATA data block exist?
> You can check this with the lswmi tool (https://pypi.org/project/lswmi/).

One instance:

  E7F300FA-21CD-4003-ADAC-2696135982E6: Data   (Instances: 1)

> Please define a struct like this:
>
> struct lenovo_feature_status {
>     __le32 id;
>     __le32 status;
> } __packed;
>
> You should then use said struct for size calculations using sizeof()
> and for accessing the individual fields using le32_to_cpu().

Understood, will do.

> Please drop the error message, passing on the error code should be enough.

Will do.

> I think the whole 32-bit status field is meant to be used instead of only
> the first 2 bits.
> Can you share the output of "acpidump" on this machine so i can take a
> look myself?
>
> IMHO we should verify here that the ID value is correct.

The DSDT confirms the field layout.  In the EC namespace, BKBD is
declared as a 2-bit field:

  Offset (0x23),
      ,   2,
  PELF,   1,
      ,   1,
  BKBD,   2,     /* bits 4-5 of EC byte 0x23 */
      ,   1,
  U7U9,   1,

WQAF builds an 8-byte buffer and assigns EC0.BKBD to a 32-bit dword:

  Name (LFSD, Buffer (0x08) { 0x00 })
  CreateDWordField (LFSD, Zero, LFID)
  CreateDWordField (LFSD, 0x04, LFST)
  LFID = 0x00060000
  If ((Acquire (EC0.LFCM, 0xA000) == Zero)) {
      LFST = EC0.BKBD
      Release (EC0.LFCM)
  }
  Return (LFSD)

ACPI zero-extends the 2-bit BKBD value to 32 bits, so le32_to_cpu(fs->status)
is always 0-3 and equals the full BKBD encoding.  I'll use the status field
directly and add an ID check (le32_to_cpu(fs->id) == 0x00060000) as you
suggest.

_WED(0xEB) also reads EC0.BKBD directly and returns it as an integer,
which is consistent.

I can provide the full acpidump if it would be useful; let me know.

> Nack, having global data like this is not a good idea.  Please use a
> notifier like uniwill-wmi.c to deliver WMI events to the WMI block
> driver, and put the input device into the private data struct of said
> driver.
>
> This would also allow you to get rid of the mutex.

Understood.  I'll restructure along the lines of uniwill-wmi.c:

  - Event driver (LENOVO_BTKBD_EVENT) owns a BLOCKING_NOTIFIER_HEAD and
    fires it from its notify callback.  It exports
    devm_yb9_kbdock_register_notifier() for consumers.

  - Block driver (LENOVO_FEATURE_STATUS_DATA) owns the input_dev in its
    driver private data, registers a notifier_block at probe time, reads
    initial state via wmidev_query_block() on itself, and handles sysfs
    and PM resume.

No global struct, no mutex.

> Please mark this attribute as const.  The same should be done with
> yb9_kbdock_attrs[].

Will do.

> Please use .notify_new() instead of .notify() to avoid having to deal
> with ACPI objects.

Will do.  notify_new receives a const struct wmi_buffer *, which is
cleaner for extracting the integer.

> I think you should do the DMI check here.  This would allow you to mark
> the DMI whitelist as __initconst.

Good point.  I'll move dmi_check_system() into yb9_kbdock_init() and
mark the table __initconst.

Thanks,
Dave
