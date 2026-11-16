Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823659;
	b=yyBPYj6R93A1ZT9XqMsjWn0k/BUpP5Fq00TChw7auRHUT6TqrvsSnknuQiNLiexPaFfA
	 VmgFTgqCVWje7Z4+Z6CguTYPiqx1nHz9fs1nDUvpnYLLVabxbRloY4Y2As+nSY6I7UAQy
	 f9CaPwWwjXSkcTXpnw6+EeS/BJeoGjiyuGYVZuQcBquJiKQfFvGZe0wIBilIeleH6hIZg
	 po4+ahYOI8uh4TeDVPF/pmg+ONBDjJ10mGODBxKVuJcxztPdsXSD6ShqGb+/8sswoyQWZ
	 D5ExzWkdfRaKTxbszILRal6BPZsjE2NJeR7Vf15JcqGWxWOiLWWjnGXbOjiErS2CJcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tpBFHUTNf3ubTfol+rHfKTH5oIi+2lUrpL+mTbVu2so=;
	b=j0DjdVGgzvVh0e1XBXGDMxfrHD55IIU4/WaAArRG3ZCGFc/jYosYaXDej+i6zQlBv04c
	 sY7WP9SGw3zvQ8lGNH7V36VpKCRrsxaPaK1Od/g+mqIaD6yF+oVDRMi+GApGOCYCzc4bE
	 SbBF1FumVDgIF8H1DRyeMyg6QTKp42mpMosz2THpUqAi43dv98paX1PoiIOBoNUDXyNjs
	 P4vKd2oLg36MwfyCPsDcZRB4Za4YukMYWJoUhX1K5d6cBk2UB/vvzgA7lwdrgXrxMfTP9
	 fYiYLeiYZyKcsYe6IjzMWy2fr0pXhhYLXWv5f7Wf34LQSNbjaPt2pf3AymPCkkq0Oig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J67QMKF9;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A84606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 10:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J67QMKF9
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so3542855b3a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 02:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794823658; x=1795428458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpBFHUTNf3ubTfol+rHfKTH5oIi+2lUrpL+mTbVu2so=;
        b=J67QMKF9MhkcIIGYJ5Bkvvqbj7VLGpcZ4rsCKzmrJi5+KrHRE230j6ju120kZNfLWX
         J1cE+ZOl7aLxrnT4yPST++LTqGR2Ykt09mp8T5Vs13E9qbW4Lu/+WiDoE28tNNSJJruH
         bgNjNJtquDRGQjnd7Ru8EFNr6ivIJuewZNyOVsWLb8CgBNrlR5TuVeOjZMOnjwhAePzA
         EXK67FCNjpWOhyayxbgHb0NWgVtheJ8O3smSSMyXh3jCiE1I5JLOmlbdCaINT+yEcgKE
         6zlbjdNROvDG1DRJpNhmSt5uUTDY3GIzhjhdronFG1PfGY29kZK4SP/yHGM0RnjQWAFo
         /dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823658; x=1795428458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpBFHUTNf3ubTfol+rHfKTH5oIi+2lUrpL+mTbVu2so=;
        b=0+nwVfuzVMn7cmUO2xOMD1eZUyWeCVaU9b6jHFz3tE+19P0ltuWo+jy1GtZxbvFyAl
         UJmqnQouvGMd8Xpc1ni7VbAMskGMmH/iSGrYomU/uocflr0jfXwZRULHH7XJ1AN0jwwH
         VraaUAieuDkMJh4+iDssJSYAYdoAsPerBP6VPLuL1QxRu30C+ZK/oNCHW+AO4mekkpX9
         Rk9MmNp4AUOVm1NMmTCZ7hAgE+VGmpvwFZ1QCP+mbJpx/TdjoOC7f5onoI7+Z8Gx5YtH
         7/1ciKiAif7GoYpxqU5MV6YC9Hf9K+e6UYPKFl3JNILsc1D1E7s7oZyPzrxMNZlQxSCB
         8hNg==
X-Gm-Message-State: APuU4Z9qBfbUfF4SDulsNTE2YUrm9JpNnKiPihFJ1gEPce+4rfvoyurs
	IH7kva36ChCYFg9ibyYdKrDULKv1frRfdrp5yz6rwafmJX0+m8Oz+nxZ
X-Gm-Gg: AYBFou1/IM69Y1ECVb13ZWfi0ZAythGgRW510Wie2vel1+CqoowpvFKMPgg6jP+HE04
	llu8pnLYP+ta132Mr/IUz/qYwmLjV/ovAV/J7nA0D37OaMogPJltzZpP1f3guxsdvCOMPQyaoWS
	FLJbDOsQ7tgn7dQDW4ZQJfVIz3IArVWbSKVpA0T7TNt4OjUaZXrBe16Xsy9j5LtJYtwx4iDMvuy
	dB5Oav5xexnhvbo/980NzZyXzaSBDhSM+oUiXsveoNM8z8Hhni5vG75PLdflVSxlfHSHI4lzZEj
	Bc2AoexqFuZOBoP7Up/+iC0buZc4mzfTW4HigsAEfiiCJJx+qZtOISjgxF44OkCImmB1DCNwZIH
	LUlcoF866KrvfvP9JoUAwpM+Ej9reSsulfqjFHRUvpZo2usaBIyACmyS/QtF8dxGF3/wuVfDHSA
	cS1lOd7+CsLwPxelwskNz2uwgwb5l/gF9/CVLbhcaJj0BtTO+REuo/Xjttfe0ZxYfSDR9+wzZam
	5CutB3sjEvRWz0qk21Yss/7ScYYFqV1mWlxOZWfzu6Nzao90OU7Yw0GqZU97X4d18ZbZJ2oU2J9
	N0mv8HNJLtgLJwP9z9+sjd3H5aYVu2OyfS0JmwJ8NxSM2Su4SZ8=
X-Received: by 2002:a05:6a00:17a8:b0:89e:99a6:4673 with SMTP id d2e1a72fcca58-8beb7f0c3f7mr9286918b3a.60.1794823658314;
        Mon, 16 Nov 2026 02:07:38 -0800 (PST)
Received: from [192.168.18.49] ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcc68csm3488163b3a.8.2026.11.16.02.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:07:37 -0800 (PST)
Message-ID: <396c839e-0a9d-45a9-991a-9ced9134446d@gmail.com>
Date: Mon, 16 Nov 2026 18:07:04 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] platform/x86: bitland-mifs-wmi: performance profile fails
 on TIMI A30 (USB-C only)
To: okluar <okluar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAFbNUuJGjo5OW1JZhO=uXqk07fmzE8yo2Qibe5PoOtHCmoQXpQ@mail.gmail.com>
 <ccc319f4-24aa-496b-8366-fcfdbd5dbce6@gmail.com>
 <CAFbNUuKTvJXoNqf-5K7VykOHtFFVdVHTc50aYswC0if4eGQN8w@mail.gmail.com>
 <ecdecef6-b2da-4d3e-bb82-a22a15febaf6@gmail.com>
 <CAFbNUuLXaP4_257tWkr-09n9h9yZX_y772LMStPY8QuGOWAipQ@mail.gmail.com>
 <eb504790-1f37-4288-9f72-0a3d7b10af3b@gmail.com>
 <CAFbNUuLmaoq22pQPzrUidJ+RC2xf2u5Ovxzy5d0LQZ7owH52OA@mail.gmail.com>
 <e4ad1ce8-6938-4752-942a-7ac6c4ed26c0@gmail.com>
 <CAFbNUu+zETsyfBwdVo-YxTB2vUG1yBPphwusEy+ViNVMzCpk-Q@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAFbNUu+zETsyfBwdVo-YxTB2vUG1yBPphwusEy+ViNVMzCpk-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/11/26 22:29, okluar wrote:
> On Wed, Nov 11, 2026 at 4:17 PM Mingyou Chen <qby140326@gmail.com> wrote:
>> Hi,
>>
>> I'm confused with this,
>>
>> could you print the hardware returned function and input->function?
>>
>> dev_dbg(&data->wdev->dev,
>>           "wmi_call function=0x%04x, input->function=0x%04x\n",
>>           le16_to_cpu(function), le16_to_cpu(input->function));
>>
>> insert this inside the (function != input->function) if block.
>>
>> And could you test another thing? Change the condition to (function !=
>> le16_to_cpu(input->function)) then test the driver.
>>
> Hi,
>
> I tested both things you asked for.
>
> Test 1 (function != input->function):
>
>      wmi_call function=0x0800, input->function=0x0008
>      bitland: wmi_call ret=-42, data[0]=0
>
> Test 2 (function != le16_to_cpu(input->function)):
>
>      wmi_call function=0x0800, input->function=0x0008
>      bitland: wmi_call ret=-42, data[0]=0
>
> So, le16_to_cpu did not fix it. The hardware returns 0x0800, and the
> driver expects 0x0008.
> Then I tried changing the condition to "function !=
> be16_to_cpu(input->function)" and this works perfectly for all
> powerprofiles:
Likely we need a new quirk item for this. Use be16_to_cpu directly will 
break other devices.
>
>      $ powerprofilesctl set power-saver
>      $ cat /sys/firmware/acpi/platform_profile
>      low-power
>
>      $ powerprofilesctl set balanced
>      $ cat /sys/firmware/acpi/platform_profile
>      balanced
>
>      $ powerprofilesctl set performance
>      $ cat /sys/firmware/acpi/platform_profile
>      performance
>
> Full dmesg output:
>
>      wmi_call function=0x0000, input->function=0x0008
>      Failed to unmarshal event data: -61
>      wmi_call ret=0, data[0]=2
>      wmi_call ret=0, data[0]=2
>      Failed to unmarshal event data: -61
>      wmi_call function=0x0000, input->function=0x0008
>      wmi_call ret=0, data[0]=1
>      wmi_call ret=0, data[0]=1
>      Failed to unmarshal event data: -61
>      wmi_call function=0x0000, input->function=0x0008
>      wmi_call ret=0, data[0]=0
>      wmi_call ret=0, data[0]=0
>
> By the way, I still see "Failed to unmarshal event data: -61" in dmesg
> for the event interface. This seems unrelated to the profile issue,
> but I can provide a hexdump of the event data if you need it.
Feel free to provide it if you want.
