Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEB141A789
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 16:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783356667; cv=none; b=IVmkvu1zSlFdVaQWQBQRtU8An+eoPnC9oFeFSQZe/UYoj3oSihXr7jFE+bNYztNshU4EM8UnYnRYgKnXkyy9DozhwEjO4MnojXE7HxyVEDEo9aRKz8DgrKlI5I0ZcxAOzfKtApa6x9P08qqtGoTbt7ud79gnUPFk3ga0tEfRCkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783356667; c=relaxed/simple;
	bh=5TbGVIjbWouXw7mOqJW3J8XbqwlyvOVeRYQFgRvAXEc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RghS2PWPm+FkvtlfT7kykQgGfkZPEcbUn+im9/me1QzTo/ZqLuX9l5p08ewCBUXpVtlTc6C/Sbd8vtdQivM2r7mTpAj/Aa1qtDkynMeFrlcsd89n+e39pBs60QsRitxf6pZrZeUYjMd1VuJ6MgzlpaCFdtDIztAMfARC+HDBjqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/TNwOyz; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/TNwOyz"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso1637074a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 09:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783356666; x=1783961466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NuMQsV+1szK+xRdkYp5qTJOb7AQUiwmlbq/txDWUYWk=;
        b=k/TNwOyznbI0oz9s8+6RPYL5N2lffhv89ObpA5VYS7AeBz2sovqIqq0k+XLKEwPWIB
         YtqSpiqSJEGUW0PXtSVcmzMD3HACPN36ori51BbKv1GyLKyWEECaIq+QBYDW+UIIn5Rd
         +hPifxiLla3LjG54N5ZvAn9K308VPHUjngQNmzBfX4thT4OQRwruDg8qG382KmiLu9sy
         ZZqQnUjxRNF1Tn2FQqYURUuuomRI2YkG8XzlJh2VkKDkdbCfXEoCZzBw/RMfitgpdi9G
         XaKMxnaC+U/7XxrFDNWBdxxcRd59hrMUmeYifp2WA8OlSt0Abz5ngl58v4gLH2Qc6IGD
         j1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356666; x=1783961466;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuMQsV+1szK+xRdkYp5qTJOb7AQUiwmlbq/txDWUYWk=;
        b=Kk6KmIALqSLqx6l4grJHURB7HVW3u6mHgouyB7+T5I3KTNpRjk++n2x1MzFpF2cF7j
         vY2iTbAltseOOa5nxSxXsmp0l8AESx5H/2LXjuRU57Ze8fw6IVMsWTsGQ7WM5S5EoHip
         wmMAFUlI4xxbsGE8EmmOUJCgnl5QpCWP1S01HwBkP/A1YOQAc07PJKQEbk+lBf4+JfRK
         HOR2diNOO2g1wj6iAB55sTPZmcItZQ+XjPD7MQrdr6/416qLAfOXytA2lk7aWyegjzVY
         2exs0ZRoAhXiaJbYjTMQ64B+Ziu2/n92lFKGy3b1s+dH9/qVynC4SykmDZRvN7tzFLhp
         L6Cw==
X-Gm-Message-State: AOJu0Yzc9gkzgGwn16QeG5b5/Wz3DjnT3KyEFeGTdeK4Q08co5HA1T4w
	x5fyVSKvE2ZaROU/LUSsToixs8ajwHSIswsUiAfwRbMEBPynwznXESK+n5gs9X3D
X-Gm-Gg: AfdE7cm40vNiWHzG5TSQuYPJ0sTjgQ4+hjjva3vzOaTABWKSHsDxNRs+z9SE3/HfOlL
	Y88Eid+f70yq9M0qUgBqT2uIIXMzRBts+dWZ2dIsVWCu9N3aPK61vmL7qgNVh059YSez/WTTgwX
	9ff+AgMbaveV7MTuzFMNbEd9q3hMcRnlDCn2EcZBu7sGoAjxkdK/XVYhlFdhpy2Jb1Im2Dmsxq1
	uLl9CeJ/4+dtJDedlsrT4eA40K+UB3fDvvoi8k1NjILD/TFdI4SS5Lwwnsb96jSBi+liisu6C06
	lXB2WrJa2A4jW5n3jb2GZDmm6wXkmEp1ddyLrNtcuuKFmDnNwzkR3mLJA1mt1j4NbC5laDbYSSh
	Wd2S08yuCq5+w4m472l8V95UOQ0pd+BiAYHcsJIjb+vUWoWNv6u9eP3Ng5Z43Uy5/S+IuHBQN3f
	stMKgocaDO4TSDqhCTbp5+9zfL7kgzDaigkTSK83bLLCKLxOZRdnI7TUUaMveCzBY5BVQLIN8z+
	SUfDR2fYZY=
X-Received: by 2002:a05:6a20:6a28:b0:3b4:b6d7:a992 with SMTP id adf61e73a8af0-3c08ec8fb76mr1709452637.8.1783356665543;
        Mon, 06 Jul 2026 09:51:05 -0700 (PDT)
Received: from [172.17.104.239] ([136.233.9.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f3c8b19c7sm37733834eec.4.2026.07.06.09.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:51:04 -0700 (PDT)
Message-ID: <bbfae176-ec4f-4f09-b94e-43e534c3f629@gmail.com>
Date: Mon, 6 Jul 2026 22:20:59 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ideapad_laptop: fans do not ramp up properly under CPU load
 on Lenovo IdeaPad 3 15ALC6 Ub (82KU)
From: Sourajyoti Basak <basak.sb2006@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, Derek John Clark <derekjohn.clark@gmail.com>,
 ikepanhc@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org
References: <CAA7g7-S_nP+jPfi7pJKj0a0g-gKXMJ7+fMH_+v11JbRRm96b9g@mail.gmail.com>
 <49faacb7-3e01-4d01-80b1-4b939a904138@gmail.com>
Content-Language: en-US
In-Reply-To: <49faacb7-3e01-4d01-80b1-4b939a904138@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/06/26 8:43 pm, Sourajyoti Basak wrote:
> On 09/05/26 9:00 pm, Sourajyoti Basak wrote:
>> Hello,
>>
>> I am using a Lenovo IdeaPad 3 15ALC6 Ub (82KU), and I am encountering an
>> issue where the laptop fans do not respond appropriately to increasing
>> CPU temperatures under Linux.
>>
>> System information:
>> Laptop: Lenovo IdeaPad 3 15ALC6 Ub
>> BIOS version:GLCN46WW
>> System performance mode in BIOS: Extreme Performance
>> Kernel: Linux 7.0.5-1-cachyos
>> Distribution: CachyOS
>> CPU: AMD Ryzen 5 5500U (12) @ 4.06 GHz
>>
>> Issue description:
>> Under sustained CPU load (for example using stress -c $(nproc)), CPU
>> temperatures rapidly increase to around 95-100°C. However, the fans do
>> not ramp to maximum speed as expected. Therefore, the system begins
>> thermal throttling after some time in this state.
>>
>> As a result:
>>
>> - The CPU reaches thermal throttling temperatures.
>> - CPU frequencies drop significantly once throttling begins.
>> - Fan RPM appears capped or insufficient despite high temperatures.
>> - The issue appears consistently reproducible on my laptop and another
>>   person's laptop.
>>
>> Additional observations:
>>
>> - The issue persists across multiple recent kernel versions.
>> - No hardware issues appear to be present. (Verified that the fans can
>> indeed
>>   ramp up to max speed by 
>> `echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/
>> fan_mode`,
>> which makes the fan enter "dust cleaning mode," causing it to ramp up to
>> max speed
>> and then back down to 0 RPM about 10 times.)
>>
>> Attachments:
>> - DSDT in `DSDT.gz`
>> - `dmidecode` in `dmidecode.txt`
>>
>> Data Collected during `stress -c $(nproc)` until thermal throttling:
>> - EC information collected in a CSV file named `ec.csv`
>>   (using `sudo ec_probe monitor -i 0.5 -r ec.csv` from the NBFC project)
>> - `sensors` information in `sensors.log`
>> - CPU frequencies in `cpu-freq.log`
>> - `dmesg` in `dmesg-live.log`
>>
>> Thank you for your time.
>>
>> Best regards,
>> Sourajyoti Basak
> 
> 
> Hello everyone,
> 
> Just a gentle ping on this bug report. The thermal throttling issue is
> still present. Please let me know if there is any further ACPI/EC
> debugging information I can provide.
> 
> Best Regards,
> Sourajyoti Basak

Hello everyone,

Just wanted to confirm that this issue still exists after updating to
the latest BIOS version (`GLCN68WW`) and on the latest linux kernel
version `Linux 7.1.2-3-cachyos`.

Best Regards,
Sourajyoti Basak
