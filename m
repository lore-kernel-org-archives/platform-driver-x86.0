Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02D44A71C
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 15:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106833; cv=none; b=H0neo6uQAKrh4nMWCddCS5PtWpMtO5qVm/wAkUi0rVj3b3//fQ16NxZI/Fi4LYGUynulglDvXuDoV/dTWLIEmR9AAlhc43iTRrQDlYEZAF0da2nQ32yfI6DwRsgHXgFEcmaPAn/1QLxn1MfyR5ZiU4yGEcMdkwPL4Hev2t7toEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106833; c=relaxed/simple;
	bh=fJB5Ff9myrCmO/cX0iRjfMrErNu2li0Eg4xMFBIqbU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwpN1aSK9hyW8Rq0mgtb2ZZWmtCkkr29fFB1JI5L4XZWTQSigmAG3TTwVGWAdOfLbqwxMy7+BTaMRIdQPbpMGmFHbclm/oFYKF9SDyEtlPEDSA146dilhJ4jfK0i6cDc6UjeI2+fpBfXvqLDuQMIn5VyaKNInx7OkarC1YT5Glw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sroTLV7l; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sroTLV7l"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66043ecf6b3so6893732d50.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781106831; x=1781711631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EkfQHZgHIIWdIY1XueryXCM+duCdJscCRpb951mBqWs=;
        b=sroTLV7lZRu6hWWfpvz9JeqMX8odtHQNLtJP/3Gp18k4iVFORQElz+KJxpUAGXnkkS
         J/DP3VEoTSli5PTII7cD69Oxwr1WYLSqTeHPt2ANiTSDQnE+ii2oQuVna8LskICiIuOJ
         ylRpUaz3/OYegZxNZNukvbmUnB1GKpdJHlxqRwFzjWd6OtAMXn5H2JiRdsOz0I8QpNN7
         8OQzc0yXo7gKFRdzN+HJrS7DFJFi3j53fWVqGjNNqovnGqEtksIGwbOsxZuE8ozssksy
         9vZFxkwRNa/BdowOB7k6SsvhLDVwYc6BVQlqDD6JrtkXvmsZy0SBmDrgUiLkjfjBlI74
         ZXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781106831; x=1781711631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EkfQHZgHIIWdIY1XueryXCM+duCdJscCRpb951mBqWs=;
        b=NhTD8mNq2Y/x9tZADDdnWOnY3x530FvrFmSxMpgU4CJe/SSgg042EhrBlDxRH7UNtN
         W521AjRWuD+nVomvfspDoIY6W/OeZUgHgflqTTuBjK+uucAsngik6st5WIt7XmH+YF0H
         XonvaXGF5+loMbmjIhRa+S+ybKan/vtebznwDdoZkTi7CzAVFWOOSs8Lt1aIXEUDMZfe
         JALFahwtAjIzuVWKk0P+OyB3g/U+BltKKXKWg5iWGnwyQ1YxQtmRchaGWj5YVQyNvryn
         X+/BROBzNboFmHWsMnVlOe4DTQuhw0PtXwslr/P4+REs5Y4sDh0K2bnGagQd1R9T07rP
         8tiQ==
X-Gm-Message-State: AOJu0YxoEkALFAOCaMPwiO+gwOReTpV47ea7Ub7i5wTdzZ6ood/eznnD
	jkGAPf4ni/dfLUS2kZvbPd64xcSc8ZzkKYeYueqqTH02MfcRlJcyvWeSru/GFai6
X-Gm-Gg: Acq92OFpV/9qw8eQMR8jj2szAZ/a+vHf3yEkjkFImMMnfGUp7v1pnxHuop2hhPp14H0
	iJHsL7UXEMsJjQd3PxlaA0Um7bEwJeeEmo1ghIt5ZB/dS9/Rab/jb6ittcxOAb3Gmsok8rzYQ3r
	9v6rVfUzVQCq1rD2cZQBx6ldNck9V9syIlT+nB7ajAFURH+ENsfPtTjw0vKipdhrvmpa2ELMdOz
	zBeNDN/q5+9lqTyGZVJRLH7tK/OgVswfeevaklUvLxeXaPsSrUNlQ59W/vX/YIQ9wqMbOnSxP/i
	qGk9ht3ZPn0kpiFzDjibNEtf8PC/jK5sq/hcbTr2EqnePz+tIBTolDnIM1Gw7fENO6z2ki5rD+o
	gIbrRlaY2O3EbmgVX5fJRLaf126VxntemrOmuchhTw3le/Kf2VxddIiVMl0DClNqi0ABknzdt+0
	W3cSafBaigx+9GuMtHKmMAacxHQfF/
X-Received: by 2002:a53:d848:0:b0:660:5dc3:3fe5 with SMTP id 956f58d0204a3-66106e5b48bmr19373958d50.22.1781106830916;
        Wed, 10 Jun 2026 08:53:50 -0700 (PDT)
Received: from fedora ([164.86.10.141])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-660d62046fasm12573759d50.13.2026.06.10.08.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:53:50 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Subject: [PATCH v8 0/2] platform/x86/lenovo: Yoga Book 9 keyboard dock detection
Date: Wed, 10 Jun 2026 11:53:38 -0400
Message-ID: <20260610155340.342949-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Thank you for the v7 review.  All nine items are addressed in v8.

One item needs a brief explanation: for the mutex lifecycle, I used
__MUTEX_INITIALIZER(yb9.lock) in the struct definition rather than
devm_mutex_init().  The yb9 struct is a module-level global with no
associated device at __init time, and since yb9_kbdock_block_probe()
acquires the lock and can run before yb9_kbdock_event_probe(), the
mutex must be valid before either probe runs.  Static initialization
achieves the same goal (no manual init/destroy lifecycle) without
requiring a device pointer.  If you'd prefer a different approach,
please let me know.

Changes in v8:
  - Add #include <linux/bits.h> (required for GENMASK).
  - Add #include <linux/dev_printk.h> (explicit include for dev_warn/dev_dbg).
  - Use __MUTEX_INITIALIZER(yb9.lock) for static mutex initialization;
    removes mutex_init() call and the need for mutex_destroy().
  - Update wmidev_query_block() call to pass min_size=8; remove manual
    length check now handled by the WMI core.
  - Move u8 *data __free(kfree) declaration to immediately after the
    successful wmidev_query_block() call (cleanup.h convention).
  - Change data type from void * to u8 * to allow pointer arithmetic
    without cast.
  - Remove (int) cast from FIELD_GET() return value.
  - Remove blank line between yb9_kbdock_query_locked() call and error
    check in keyboard_position_show().
  - Use %d format specifier in sysfs_emit(); remove (unsigned int) cast.

Patch 1/2 (lenovo-ymc) is unchanged from v7.

Tested on Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.

Dave Carey (2):
  platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
  platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver

 .../testing/sysfs-driver-lenovo-yb9-kbdock    |  19 ++
 MAINTAINERS                                    |   7 +
 drivers/platform/x86/lenovo/Kconfig            |  14 +
 drivers/platform/x86/lenovo/Makefile           |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c      | 312 ++++++++++++++++++
 drivers/platform/x86/lenovo/ymc.c              |  19 ++
 6 files changed, 372 insertions(+)

--
2.54.0
