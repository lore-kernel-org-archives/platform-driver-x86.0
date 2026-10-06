Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACDE340D90
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 05:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791263045; cv=none; b=HW55HvM2HjhG1vlf2bEFuozYalm+gIvBV2fEtgHbpgEEPH9Om07LaWiGvLUdUq18kYM3fYa+rE2oYJsgY0pXqWv6zzMaO2ZH63mDrx0+TS690wOcHES2dkFkHOVzS4P8p7Xq3gtUS7WBu2Jj2Ds6mRhbf8w7m94Wts6BysEZtVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791263045; c=relaxed/simple;
	bh=35yqeoK1Ca4zsZtqSZmu4xz8jLyJdWIzdKh8MiPbTz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8t3pALKvoxk1fH9UlFXwMk0WhKsZYzOkqOTr3S4lBT9sq32Lh5BWmGmN8XUZCDzzUybghA2QQ+W/T7XPyeF/QLJ2/pCfFicXCKcT6RJnMzUaEs37rnqGlMgU2CtRALrSrDJnoW355CC1596sJzOwhSYM1odQTuofcFe2qHrlfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/XMHn59; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/XMHn59"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1419d3416ceso4015996c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Oct 2026 22:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791263043; x=1791867843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBHYJMqsGQFbOcbBkoUbDGCXiNP84P/hdgY882HRDEo=;
        b=a/XMHn59k1cUqfADsfHmZ9VwxiMD1KP2ll011DBWf/htUb3uQfG+yBJp8nRaMVURro
         Ir1NTvRQYk+j0DvgAcmirF7e6ebwff9aDDwTgUaGNhsExsohld0kvQ0nZRaUZX/pF1n5
         7uiCPiQOGHoaVZYcxBewR23DjnNOGRqCKghq8YOjd+89ont0G3YpdFh7HB1oklP6HvLc
         ZUn66ihGokc6ixyDLtnQI4PfebJ+fMQjyVMTogmRPyArA9dtTrnM5WRd+jnFK6brg3L0
         NAq74cT6RXg1PY8T2TEE7hipj+MphrtX0Ugatf+im6SUF2b/AfwaYQji8kxrb8dTzk7Z
         pY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791263043; x=1791867843;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBHYJMqsGQFbOcbBkoUbDGCXiNP84P/hdgY882HRDEo=;
        b=iKwKqchflmcRxKQXWMyZT1w8FX5Zmnho3cE2ltOItrhIpM9cxNnb10nSjeB7q1hDGU
         JjKJbY3SQM/7WBnJ9khvW6heHkEUWlMfHClzYwObddhQFcFu6sCiDrr8P/uaQm86GRv8
         vx0a3NPkq0OdvB0mgSKCzIHY6KEyKi1OINoYWVeeAC/myeUPx5S9nWvoCJz6ixhBkkQj
         PxGtle1yvJxv04R1FjaeDu7f9B3r/Ct+lzmmp9/nlQUyXVj0tAgNdAQsW0RbS+SBmiHw
         SyZ9EpQZT+UW0amAlLueVB4YIA+ET95dEejmqNYLL885TUxTNbSA/TTd0CKGUGARpgRg
         Meew==
X-Gm-Message-State: AFuF++lWqrQpQV+9haDClVwnyJuTW+ruNcpQ3azPVhzrUhqaQAFqeUS3
	rOakknkd3S4/OWU3jSpUP4R6epzK3CXVfoDfcGWMtCC+FSyzkNxQP3RM
X-Gm-Gg: AYBFou1ta9IxubTsQHyaJsnxcpjfSu/j6oju6pTnjAmagYNNGoPrPxaZzBtszl0vzAx
	vCmKNByUqx53JmCUZkcbymSvE0gKrK7oUKVyA2HSD7iExWnvwEENTIwHmEKjYfq2RcDwC+TxGGd
	grjgWojE2D9goTcSwHZamkyOnF4qqxalQJu5q3f6TpSuW51ox86X1KTWDIHZttbuZJfhEhxhwgE
	+tz64i+6crcmtcRTc5uqdZTEw8gdWBl16uCz6KguC+vMCSq3X6MHQSpoNoLRSRGflBv+yCncDrX
	nNz3e8IuElv1lNau0VXi/B0z1PUjqJYGSbHe+CazOX6ny2ocoajPFJExcSqSmJ7wAOsZIhDP/wx
	52fCLpjyejPvAwcWG/WZKupDWFR90HW6gkoGHVb8vhjOtHgE4gtahlJrS8z1fVgmhAZ7c6JuQWM
	iw/2wsp4iSlxUetuj+92OtFPUGH46RlEPVYgXQ0nJ4G59V91mJP5CpI0SN8MfsmOKiN0M8FO/9d
	AgBjm0CLNAsDK3Eg12yH0U62j3yCnzIKmyJpwF+41ZMrlwIjV9P6wdr1fI7/P95cU8=
X-Received: by 2002:a05:7022:158a:b0:144:fb42:52 with SMTP id a92af1059eb24-151c36be9c1mr16833334c88.28.1791263042709;
        Mon, 05 Oct 2026 22:04:02 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:de2d:6e5b:74df:ad41])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d7a824d52sm3460427c88.1.2026.10.05.22.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:04:02 -0700 (PDT)
Date: Tue, 6 Oct 2026 10:33:59 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Piyush Kumar <aryanbabupiyushbabu@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [BUG] hp-wmi: Mute and mic-mute LEDs not supported on HP Laptop
 15-fc0xxx (board 8DC9)
Message-ID: <asR_wY3ZGJztPywo@archlinux>
References: <CAC604MZ_ssUJO+BFjvDXxTCt_uUGveQeH-TmrBdvJrGGBGYh9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAC604MZ_ssUJO+BFjvDXxTCt_uUGveQeH-TmrBdvJrGGBGYh9w@mail.gmail.com>

On Mon, Oct 05, 2026 at 06:01:15AM +0000, Piyush Kumar wrote:
>Hi,
>
>I am writing to report an issue where the speaker mute LED (F5) and
>mic-mute LED (F8) are non-functional under Linux on the HP Laptop
>15-fc0xxx (Motherboard DMI: 8DC9), although audio muting itself works
>fine and the LEDs function properly under Windows.
>
>This issue is tracked on Kernel Bugzilla under Bug 222044.
>
>Hardware Environment:
>- Laptop: HP Laptop 15-fc0xxx
>- Motherboard DMI: 8DC9
>- Subsystem ID: 103c:8dc9
>- BIOS Version: F.25
>- Audio Codec: Realtek ALC236 (103c:8dc9)
>- Kernel: 7.2.6-zen2-1-zen x86_64
>
>Diagnostic Summary:
>1. ALC236 Codec Control Ruled Out:
>   Direct hda-verb coefficient writes (node 0x20, verbs 0x500/0x400 on
>indices 0x0b, 0x19, 0x34) return 0x0 with no effect on the LEDs,
>indicating the LEDs are electrically decoupled from the Realtek codec.
>2. The LEDs appear to be handled via ACPI / EC under hp-wmi, but lack
>the necessary quirk/table definitions for board ID 8DC9.

Hi Piyush Kumar,

As stated earlier, hp-wmi does NOT handle LEDs and there is no necessary
quick/table definition for any board in this driver. Please post this
hda-verb diagnostic summary on your Bugzilla bug 222044 where Zhang Heng
has asked, he may be able to guide you best.

>Diagnostic logs and WMI/DMI details are available on the ticket.
>Please let me know if any further dumps or testing of patches are
>needed.
>
>Best regards,
>Piyush
