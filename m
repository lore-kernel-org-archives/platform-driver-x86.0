Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C416943DEC6
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797081; cv=none; b=kUOAbb0mf9FtYnbmK6octqRqBFNX9/8jx2149NMy0/PgHUQEGcNbKRH6k51+7cI1bwPOtOW7Fyr5P2ZUfy2PGR6GKJOxjIN7tBjHWQzBnDzzafrTuUUt1NpJO+oxbPyM/vywM/TrCr0aN9yE6Xt4pTz0Rj5R6ucL5W8zeks7b74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797081; c=relaxed/simple;
	bh=7UO/Qdo7R67hQk5z1GlG12dvtgsF1F7tVE2joftpjRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ao8IeWWJCKfeebzsK/kxqI21akX6D5S/ynaKv/ybpnZcNUpxoZVven/lYs7A3wQJChBCDjaBhOw8g9dnsR5FOtIgrS1YTvhVoPZ3qet8Bs5K6oEu5l5pnsjYS5h9MK8Oyg49fNT2VTusMvBfQknegQQEcFFnhsasdLN1iSsJl04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BseNpMSw; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BseNpMSw"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso6854692eec.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 12:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790797079; x=1791401879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rVuWcz5sCe1pqCK43i5kCMQ+Y9geilt7Ru4TUzBHuA8=;
        b=BseNpMSw163TAjDn1Qfam1SwTo71JYA51ePcIZjEqKTUNfJFBLdb+XLSuy0Q7w+weW
         mDdLnYj1fh9U1DzIP14NlTYTO9ga1mFtE6jfGSd6Q4hBhrmynWpZEvsA55Unosci8U3z
         m8Dz5mRcMwOY3dcR99un86CktUmvD++ZMyEXEO0Naoa4LfcZxieVg6So7a+IxY4WlG4Q
         vJsSQibaJ8wObyQgM9+TbeDl3VK/uvNgjV/GTdXLBZOZcD4VZCacOEBPO8pa8pHtx8lY
         EywUbxLyqZt0skgZmos6EY/L7hx6UqGndEHY+sQ4hNKQy5lpdZIObxKqt+TmMlhbBgrT
         SvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797079; x=1791401879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rVuWcz5sCe1pqCK43i5kCMQ+Y9geilt7Ru4TUzBHuA8=;
        b=Kx0IoDLCJ3vPEMLUAsjrg63ql5ibGb2FkzA+LEAuToTjYOx5MaUHqQW6Pg25pMVlVn
         3+r5Dg2V4pOfyizDAH779UqqucifynS1lihNzJobsfXl/YLu3J+qKW4DNV97CuL+q7G/
         8yF1olR3/ApsvTSKEzu1Cigg17Cj4CcmyoWdRah1PX1ljfdn7hiaw/12mAfxsuHop+7z
         jQj75k78NrGdOwEoVQ3PWlC9vO3F0Witb76NFgaE0S/Rcz5+nyarT/sNTKXqBmqWF7RQ
         vi6wqwDKya3cMP++AebxhyShR12Zw5z4M9Ofi8hRUBp5fatXTiEQkdnz+VKNsvs9SWr2
         6lXA==
X-Forwarded-Encrypted: i=1; AKwUvBwQvf8a+CeZw4gbPGBZd3dLfgLtngYcSz3Q1wIGxx4jxylLubWdLToXLehODAOgOauraEtZF7TYJDFCyyBfVooUPXi4@vger.kernel.org
X-Gm-Message-State: AFuF++mBJ7A+qsmZPrPpb88G/YMRvD+JLp6GU2QsqAq2/RDK1flpWl71
	7obzSOqh4sIaVViQl3ALXQ/pTmm0lLHcBaqdPJs8LxRbSnk/IWsyXvrV
X-Gm-Gg: AYBFou1h5ZGZM559OLv8ni+VJBWElPmQlVslemcjKZlydABz+7rVLsqdpT1xt6kZOWc
	zlAFLj0hu6lmtoysLgjVqCgV5EUNqS7LPXFG+FWvGnE4zl3JC73hbeUl7AoNZzM5TMZFvbxvqvW
	VgWLHsctXUjwJ9yw/KfKYqmcVB75wb+3jYAt83V6tFJ3NWfo4ZwJXL2+cu0NboBt/UwPbOXWGyM
	ID1SF4XKJyDOsp4ACHxslK3SXAByzPNjdyifO12BWMJP71bM67wlFtTm753Jhk8AKDFhXZyyoTl
	7e2GVcky1Gi05hA0s+TNiIAPGGzC1N8Whu9ZdGsk4wCcvXi3ztL8hx/RmX2ltZe6edk08hie27V
	bpRVm0uBwp4ojnPr2W18gehZqF5yrbNgQcbVojlFtq8tRZ5vPrcecibPi9oleWVXoOg+p9TwmK1
	eaaNDnNC8xaX2I5k8K2DGTC2HxM0GVXeNI7IjHxx2PlLmzpWS5nA/JuQv6+oqUViMaHvT5x+Flt
	ptuAIis361rJNPi6eZFWQwuNOh1FFJboiCBqQKF
X-Received: by 2002:a05:7300:8185:b0:34b:7e89:99d with SMTP id 5a478bee46e88-34ce130f8c0mr3999019eec.36.1790797078621;
        Wed, 30 Sep 2026 12:37:58 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b9ef:3916:2e49:feb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db0c8cfd9sm1129185eec.1.2026.09.30.12.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:37:57 -0700 (PDT)
Date: Wed, 30 Sep 2026 12:37:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ali Ahmet =?utf-8?B?TWVtacWf?= <aliamemis@disroot.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hansg@kernel.org>, 
	Nitin Joshi <nitjoshi@gmail.com>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use input_device_enabled()
Message-ID: <ar1iwx_390hWw_e7@google.com>
References: <anK1j7hbMyFHGBUS@google.com>
 <178947195441.31094.9793704324340226838.b4-ty@b4>
 <20260930075829.53484-1-aliamemis@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930075829.53484-1-aliamemis@disroot.org>

On Wed, Sep 30, 2026 at 10:58:29AM +0300, Ali Ahmet Memiş wrote:
> On Tue, Sep 15, 2026 at 02:32:34PM +0300, Ilpo Järvinen wrote:
> > [1/1] platform/x86: thinkpad_acpi: Use input_device_enabled()
> >       commit: be0048786d53375fa4eace15cfdf65593956a1a2
> 
> This hangs on module load for me. hotkey_inputdev_open() gets
> called from input_open_device() with dev->mutex already held, so the
> new lock in hotkey_poll_setup() deadlocks:
> 
>   INFO: task insmod:28182 is blocked on a mutex likely owned by task insmod:28182.
>    hotkey_poll_setup+0x50/0x140 [thinkpad_acpi]
>    hotkey_inputdev_open+0x36/0x50 [thinkpad_acpi]
>    input_open_device+0x9d/0x130
>    kbd_connect+0x8f/0xb0
> 
> I guess hotkey_inputdev_close() has the same issue. This was
> next-20260929's thinkpad_acpi.c built against 7.1.11.

Hmm, indeed. I wonder if below will fox this for you.

-- 
Dmitry

platform/x86: thinkpad_acpi: fix deadlock in hotkey input open/close

Commit d6479c25ecef ("platform/x86: thinkpad_acpi: Use
input_device_enabled()") changed hotkey_poll_setup() to acquire
tpacpi_inputdev->mutex and call input_device_enabled(tpacpi_inputdev).

However, the input core already holds dev->mutex when invoking a
device's open() and close() callbacks. Because hotkey_inputdev_open()
and hotkey_inputdev_close() call into hotkey_poll_setup(), attempting to
acquire tpacpi_inputdev->mutex again results in an immediate
self-deadlock.

Additionally, locking tpacpi_inputdev->mutex inside hotkey_poll_setup()
while holding hotkey_mutex introduces an ABBA lock ordering inversion
with hotkey_inputdev_open() and hotkey_inputdev_close(), which acquire
hotkey_mutex while holding tpacpi_inputdev->mutex. Finally,
input_inhibit_device() calls dev->close() before setting dev->inhibited,
so input_device_enabled() still returns true inside
hotkey_inputdev_close().

Track whether the input device is active in a driver-local boolean
protected by hotkey_mutex instead of locking tpacpi_inputdev->mutex and
querying input_device_enabled().

Fixes: d6479c25ecef ("platform/x86: thinkpad_acpi: Use input_device_enabled()")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1225b01ed14d..40e9763a12f8 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -1887,6 +1887,7 @@ static u32 hotkey_reserved_mask;	/* events better left disabled */
 static u32 hotkey_driver_mask;		/* events needed by the driver */
 static u32 hotkey_user_mask;		/* events visible to userspace */
 static u32 hotkey_acpi_mask;		/* events enabled in firmware */
+static bool hotkey_input_enabled;
 
 static bool tpacpi_driver_event(const unsigned int hkey_event);
 static void hotkey_poll_setup(const bool may_warn);
@@ -2544,10 +2545,8 @@ static void hotkey_poll_setup(const bool may_warn)
 
 	lockdep_assert_held(&hotkey_mutex);
 
-	guard(mutex)(&tpacpi_inputdev->mutex);
 	if (hotkey_poll_freq > 0 &&
-	    (poll_driver_mask ||
-	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
+	    (poll_driver_mask || (poll_user_mask && hotkey_input_enabled))) {
 		if (!tpacpi_hotkey_task) {
 			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
 					NULL, TPACPI_NVRAM_KTHREAD_NAME);
@@ -2602,7 +2601,10 @@ static int hotkey_inputdev_open(struct input_dev *dev)
 	switch (tpacpi_lifecycle) {
 	case TPACPI_LIFE_INIT:
 	case TPACPI_LIFE_RUNNING:
-		hotkey_poll_setup_safe(false);
+		scoped_guard(mutex, &hotkey_mutex) {
+			hotkey_input_enabled = true;
+			hotkey_poll_setup(false);
+		}
 		return 0;
 	case TPACPI_LIFE_EXITING:
 		return -EBUSY;
@@ -2615,10 +2617,14 @@ static int hotkey_inputdev_open(struct input_dev *dev)
 
 static void hotkey_inputdev_close(struct input_dev *dev)
 {
+	guard(mutex)(&hotkey_mutex);
+
+	hotkey_input_enabled = false;
+
 	/* disable hotkey polling when possible */
 	if (tpacpi_lifecycle != TPACPI_LIFE_EXITING &&
 	    !(hotkey_source_mask & hotkey_driver_mask))
-		hotkey_poll_setup_safe(false);
+		hotkey_poll_setup(false);
 }
 
 /* sysfs hotkey enable ------------------------------------------------- */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

