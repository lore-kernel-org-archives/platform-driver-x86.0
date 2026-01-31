Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0012D2FBDF5
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 Jan 2026 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769856985; cv=none; b=NpbjLlXN/pLHbJQI2y+lzFDdd3MtPMtQCI3olnPDtXH3CWUAYV5lQWQk71WMeClO8tX5+7fcMDGmBBnonkid4EUStF8EiTkBL/1uuUIw6SGM9itBulk7TtFgTsQ/E1V3arfQNkVd8YzSmX4jH9J15YlIvstYSMFZXR0Ol/SpP9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769856985; c=relaxed/simple;
	bh=IXYnMZCHa+nJkGewcb+7N7pFC7h33Gx+yz02PqpVZ6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ai31bWoiEOKJDeyZWPX1Lc2hEXtW/6+ljM97NEuTxNxBX4nmNcEOYsbaifxPjk+PTsaILsVgZfSfT3TQ7EF/EcGgT6ajIXyBF/ALlyjt98N3UJOTypnysDLJKTgVif+E+2EPqcsHwEuKghs43xHWmlAW2IO4O1ekAOkCWDhFAw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1AUmRD1; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1AUmRD1"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f47610542so1659067b3a.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 31 Jan 2026 02:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769856983; x=1770461783; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NffXSXo4n/zg6O8B9LZhE2kooyihV43rBdNcswO4V5g=;
        b=E1AUmRD1qBABX2XCZBWcGjI+pqxIVwR4WxbWqPtc3vqTuqbedzN14dwjQCWAV4tHJ0
         DhIXfoMyBC18x4T9PGuA37GsOpX8NKQembKjx5mTTEtrN0dpxI7zC9EbMHONWAq7gdas
         6iaxpbOde6xj1BF8+vxbkqMM2BUmrSoxk8lWDqVZvodgUcF073tdI88oQkRQ6tp7uIDT
         DitYx3mRZqPVx/AZPuYloXxy01r7NxH9qrv/1bHl7U7PTyXXVmrbgSnFi83OzXk4s5R9
         nKGnqU2Tg+SG6Sz9ed36KxuHM6aB/hYD41isn2NKk2wZmYjAORv1bYpn8C0xMu+cpMD+
         8G4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769856983; x=1770461783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NffXSXo4n/zg6O8B9LZhE2kooyihV43rBdNcswO4V5g=;
        b=pY+4sGb9BByvKQy4EUojQ1ki+AEiUXFOje7+P2Gac53Vp3fqeXxlI+IirPwvKyEemz
         midExgAJC9gTvN/HBPRlsigT+iSw9tWqgvu4g9T78PfeBHMpKuybS6pwFKLqkXFMnbl0
         FrqeLOj62hINrMW6VbbdV6EKnwDP0cTz0SFu5IL1eARI+ql69Yp7mjfvup1Il9pe8Hh5
         78ZOUE9sHyk76blCM5N/9qrUWqvT+SDBgsULd0P89SKTosrx1T1og3e3zoWAqEwJlWMu
         Pvt62v2Y6NCvGh7zxg0tGS5IeUlPsnZPxYjwvglrtjy4+8RYGvuZhFGWa35D7bGhn7Qr
         i3jA==
X-Gm-Message-State: AOJu0YxI+XJ9dTC5Pj4Dp2Qhez6hfu0iAoprOqLp8r+MDEtFah1eTLBh
	AHxTu/yshw+kFGBBItbcREvTRgk9iOeFdRd4+M5qkUSwtB5XVgnIRDDQ
X-Gm-Gg: AZuq6aIN+3GFd8jFVmYZRlr3xlJ7wT9rGA2vx9iZI71rwnHSiqyM62i/UaTUzLh+Flp
	MiiePnCOy8w5KVRpri90Cywi9AdIHCA0AkUkyUWp2WpjoTpdfGs9N4BP4FKu/b1++e3FV6hzGf2
	8c9UEFKY3xBKwEGGFwIdlhpUO9jmUbuzsAjGu/YD3/6qdbfB5hZnYWVaEq01I5XbPhuDUpB4h8o
	XoSD8z6GcWiwNMP+QJm3mvXDkMZqZLw25nhdPETeFjeYRv7eGL2OXmtItyeuACmo+sOzntLuM3O
	D1tUKyQ6kbjV55+iEhV6fI2K+HxHro/hnvWt2CmckOLInt20zWfdwZ7SKxDyu+ifrtn1tzNZtvh
	s5bEDaoNuUSwwUkn+ETiUH87QNQAC7LEcyhMnyzgT13G8gKHOmsIgjcXKc7k2p1BLBK/pD53mPx
	ylixJVZISORM4Y4CwE6bVai0blu3iYtwNSd/bDWk5ZTD4VcJuECEPi5X2I61bhqdi2BUhJjAKXL
	6+M4IyfbKyCSx8Qudk=
X-Received: by 2002:a05:6a00:2d83:b0:81f:477d:58db with SMTP id d2e1a72fcca58-823ab75f27emr5577615b3a.39.1769856983260;
        Sat, 31 Jan 2026 02:56:23 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b4e7b7sm10427322b3a.21.2026.01.31.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 02:56:22 -0800 (PST)
Date: Sat, 31 Jan 2026 16:26:19 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Fix Omen 16-wf1xxx thermal profile and add EC
 readback
Message-ID: <aX3flEPm8UApZWhL@archlinux>
References: <20251218124303.22024-1-krishna.chomal108@gmail.com>
 <20260113182604.115211-1-krishna.chomal108@gmail.com>
 <176960558045.3650.7825713719598813557.b4-ty@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176960558045.3650.7825713719598813557.b4-ty@linux.intel.com>

On Wed, Jan 28, 2026 at 03:06:20PM +0200, Ilpo Järvinen wrote:
>On Tue, 13 Jan 2026 23:56:02 +0530, Krishna Chomal wrote:
>
>> This series fixes incorrect thermal profile parameters sent for HP Omen
>> 16-wf1xxx and implements hardware readback support for Victus S thermal
>> profiles.
>>
>> The first patch refactors the DMI handling for Victus S boards. By
>> moving from simple string list to DMI system id table with driver_data,
>> we can now map each board to its correct thermal parameters.
>>
>> [...]
>
>
>Thank you for your contribution, it has been applied to my local
>review-ilpo-next branch. Note it will show up in the public
>platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>local branch there, which might take a while.
>
>The list of commits applied:
>[1/1] platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile
>      commit: eeeb4c9874bb7ad11d322156443b1d3ebfaaa1cf
>
>--
> i.
>

Thank you :)
