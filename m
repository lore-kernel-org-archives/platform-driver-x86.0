Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D63C3429
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 12:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475151; cv=none; b=PcZ26LI7YJUxB8nPY6+9+VzFPOEJsOE7xuXh7uyoBdH2fCotxSlflMFj2PMw/VT3qIErtI7qhUZaq7ymLHtLKFeZD2Lzlcy4c7PTshx/yYfWYX3uht9NfN9kiYKVGlTLZiQal8IE3QnGanCz1RfwcRcNrSH5Z80X4jAERmEccak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475151; c=relaxed/simple;
	bh=TSGU6OJ0h4fUfeq573U3yF+hws662Cowi5xUNxY/Plc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMtJZD8+Q733mgGG9Jy/0fxJNS7byLeohjQpXPx8bwQGQ5v3T2qtwWVaTay+JfmFWVtT7MxoeQD3f8F2c44Pit3y63q9g/GA0RvGtJUhrHk4Saqx/g0gRYqu5Aqqvb2F4S8eRpz3LLPfgb3l1omUwbCPs2w9CDFMI7FIry8qmeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Yp8lsIWW; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Yp8lsIWW"
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 224843F2DC
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 12:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1789475145;
	bh=OWz2Oh+f3I45WPvVMwnriAaMSjFo7OhzWowmJMieGyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Yp8lsIWWV5r/jk8wC5l3ns4glaXn1V7ailoRvVoygRt5YgPYNFMFzi1fpyZcM4pcN
	 OGWv1N3u8SETrNTKbwJIspLVWZAHhl5wOURtL79VGOvgN5INb0Bf9pu1vAumfjTqIg
	 M6cwPFZ94UQhFSwjtK537WPgnFD1PIWFWcN4vY5DitDtVo+QP7jHmbX3jzjjn7bTMf
	 2wcA0zY0tPlc9PJoS6t0RLv1LoXiZGuIwvESeE3cKiWv0GgnjEIeRXUAKB/ONGjZ2N
	 jc8umcnc+qR4AfcWx2jDOoObiTuaexsRaYkI5CWTm8RvWGABgs8nKsSeTSFwy8jt7e
	 SzjGQqPUHi7skt0owxiwb+Dwhz8dP6iui7LtOZx5D8JWEHiOVMpKJySKUCP8evgm5+
	 Cv8/JW718vjFgwjaNqhZiMCmMH5SbKBD29yeaP3DOVhoaImKzX7BP/2JnkD4Qxob9z
	 +2yLzzy44Kd+8IWqvdhHyERWte+zRmFn9XBGa+o0gPQUvjKqoKATaNW5ZhysSgoRsd
	 yQbLC+wGBmfbqvknGsdFj9LK+Ipui1hGXUeynHfrRi0ypiUTmkEglLw9HKYn6DBPtB
	 R9QsZScim/GiadeJLHk0szOBb8C7UoWADs3doNqZwWnURwrYvHX67eSwua/jASUCKq
	 hIyJaf35uyti1xTIyYPbV7K0=
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8688139460bso4304090b3a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 05:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475143; x=1790079943;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWz2Oh+f3I45WPvVMwnriAaMSjFo7OhzWowmJMieGyI=;
        b=eEbsdYrRqACMiJEf2lgtIBSs3ddsKheW1xKFRlcGHu3xudUlrXOmrGAx2B6eM7OD+3
         dOS2jCZ3u9wmc5QWgFrPdJVhgmA31cMkL9ckmz9MP2X+xtfPOoqLucDo+/xx0L302Bds
         QK7K5m2AGpjGq4WDxWI6lZcayKJOIAAgL43EkmDf4JScTh1T/v4zbGeGzq361QPhen1/
         g0K92ULy26P9MqRRlMudOYrS3PqC13YEg0nsieePjR1yV45azCYvyAM/bofvLH1uoOqg
         gdDKdin/3hyaJsBzBWHSgtWMtwgheRyP7ivjUuhauTcKDbg4/6+B28yDq5giTuvgnJ6w
         woDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCoGNsUxKX31j1SSXRlrw6yA5tfKk5VFXJGSj273DDjUSgzdcVdPVV9A/bTdNtuycsAeDsI6zPeVeQPQva0iUaLhgK@vger.kernel.org
X-Gm-Message-State: AFuF++mDnaC87vuxKOiTndYX0mWPLXDrqEp0S9shoKS/hUCVLaDcbIoC
	7p4byjAIpcbaaVanU7Z+QLAprHbJ3mtwBJflfuy4DomhZyilc1+v3PP/zrvKItWBr+2lo2e+HhV
	QGLaQBRE5DnJTeGBE+LrH49vs60/ClrpYNTxhqv5DHbGK3UtMf8M0LsDcya6lxc9b0WZ9lD/5Sa
	0qoymjq8EYz++1Kmg=
X-Gm-Gg: AYBFou2zjUHhZSqa+5OU0GSyylta5q2EpDp6Rzp6ddNhZuQ6G0grBaJA7zxGsdNY2XU
	yUx8SKu7YdsmGnTikZdQ8xbCjwH9d6sjl3L/byE+HnGtg4gVmYYqYAD6qUNn5E0vOMd/kO4e3YG
	9DfSsUVSlM/X+iqMVo+Bg0cDcrK8Y9OgrH2Pej81APveltmAvF/BPsfuh+lYcIPBe19xE1/B3Zu
	QZIa0XdV8RiXiFd/tK78QpkOn0knZN3dK4bUg/vHjzCoH9+re002/0rNP1W0ynmQF9mRb8SGIpm
	JY4DvE6K64Cy+3bdcqYBXO2DBjX6xXSfZCsHibEmXpMyd8Fwgq5lAwFnK5tc8SMcZ0jolRNQMEx
	r2htMsMQ2rx5fDP2LbxU+ArOB2DKxXs04ltmZ+qFSybgwa9FtH41E
X-Received: by 2002:a05:6a00:4c9c:b0:85f:b00b:8760 with SMTP id d2e1a72fcca58-86f82a5efbamr14761138b3a.5.1789475143129;
        Tue, 15 Sep 2026 05:25:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c9c:b0:85f:b00b:8760 with SMTP id d2e1a72fcca58-86f82a5efbamr14761047b3a.5.1789475142601;
        Tue, 15 Sep 2026 05:25:42 -0700 (PDT)
Received: from acelan-Precision-5480 (220-135-95-34.hinet-ip.hinet.net. [220.135.95.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b28fc129csm6022017b3a.25.2026.09.15.05.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:25:42 -0700 (PDT)
Date: Tue, 15 Sep 2026 20:25:37 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Shyam-sundar.S-k@amd.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, Daniel Gibson <daniel@gibson.sh>, stable@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/amd: Stop counting intermediate cycles with
 metrics table
Message-ID: <aqk464fQ6JqlcCUX@acelan-Precision-5480>
References: <20260914141734.2703545-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914141734.2703545-1-mario.limonciello@amd.com>

On Mon, Sep 14, 2026 at 09:17:32AM -0500, Mario Limonciello wrote:
> The metrics table doesn't increment for all cases that can cause an
> intermediate wakeup if the cycle is very fast.  This can make the intent
> from commit 9f5595d5f03fd ("platform/x86/amd: pmc: Require at least 2.5
> seconds between HW sleep cycles") not work properly.
>
> That commit originally was measured to work properly, but it was
> accidental due to a logic error.  The logic error was fixed in
> commit 4dbd11796f3a8 ("platform/x86/amd: pmc: Clear metrics table at
> start of cycle") but this now masked the table doesn't always update.
>
> Since that code was introduced, Daniel Gibson added a number of changes
> to the logic which includes a state variable introduced in
> commit 037f0b03c663a ("platform/x86/amd/pmc: Don't log during
> intermediate wakeups").
>
> Utilize that state variable to instead decide if a single sequence has
> started.
This patch fixes my resume issue with TB4 dock.
Thanks.

Tested-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>

>
> Cc: Daniel Gibson <daniel@gibson.sh>
> Cc: stable@vger.kernel.org # 7.1.y: 037f0b03c663a platform/x86/amd/pmc: Don't log during intermediate wakeups
> Cc: stable@vger.kernel.org # 6.18.y: 037f0b03c663a platform/x86/amd/pmc: Don't log during intermediate wakeups
> Fixes: 4dbd11796f3a8 ("platform/x86/amd: pmc: Clear metrics table at start of cycle")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 6792aa2c61874..e384b56d67559 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -701,19 +701,6 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
>  	return rc;
>  }
>
> -static bool amd_pmc_intermediate_wakeup_need_delay(struct amd_pmc_dev *pdev)
> -{
> -	/*
> -	 * Starting a new HW sleep cycle right after waking from one
> -	 * can cause electrical problems triggering the over voltage protection.
> -	 * That is avoided by delaying the next suspend a bit, see also
> -	 * https://lore.kernel.org/all/20250414162446.3853194-1-superm1@kernel.org/
> -	 */
> -	struct smu_metrics table;
> -
> -	return get_metrics_table(pdev, &table) == 0 && table.s0i3_last_entry_status;
> -}
> -
>  static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
>  {
>  	/*
> @@ -804,7 +791,7 @@ static void amd_pmc_s2idle_check(void)
>  	struct amd_pmc_dev *pdev = &pmc;
>  	int rc;
>
> -	if (amd_pmc_intermediate_wakeup_need_delay(pdev) ||
> +	if (!pdev->is_first_check_after_suspend ||
>  	    amd_pmc_want_suspend_delay(pdev))
>  		msleep(2500);
>
> --
> 2.43.0
>
