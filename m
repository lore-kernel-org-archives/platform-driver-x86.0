Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219371;
	b=xXp7PW+bcNbpxocgs6d2r3G/weHq+c3uIjFL+cmorEpcHEMhC+spIUNIowZeBk/DvrX5
	 GxI9lLD2trOnXALKzevw4BICYtsibDk08WdLoz3AbKz9AOYDBMQ1G/8dnuGQobeC9Wgg1
	 ICK1b24NpHztRi0PgjvU/Opq5NTkpTDtBzKYkPpYteyhRN1io090BW/vay8rE45ftKf1v
	 gqpW8I76t5FICdfwS7hCUhnIK+JmRWZN1jsNj8rUPhS5vaZ85MdLaC+nWksTSjMsH7/qZ
	 yt2zavLTCYj9YEfdlpSFTy05UNMSn7LiQJTBE0G6JXUzvKzfE0uZDVQ+shMSS7B4xWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=E/J0vDHjYYsOxr5BvnUrsz1W29IUkzETeoUB3/3KMgw=;
	b=ZKQRz7/6nmtYAzqVkmLvKrNgWz08Z/tCXSY3LObO3Hu43qHX+BxJmiadINyJK6GljoU3
	 BGFzMkI68Re9gzFlNU/pJ9MOszFArOpCVpIVJw3LcNoQqFu9sLuVRWl8bRUqvr0fnli4t
	 njMew2Bo0sPr4aM1jS/uoP/PlU1tJe0WalNfKi8MqvdEjYq7WmsO8En9cIcbjKhqlLifw
	 NBIQSO278tD0jP1rVK7vQ4ejsB88eHKyNR5UFwnwy+n3ngV1aGyGeh36K75G1SC7bEFC8
	 SEjV9+VUYgCQ1LXWiXEXXDY9Cg+97H9J8pJ99jjY5HPn3BquZ1YoiKMJOniR+GzLIog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vj1wx322;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8959606A321
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 10:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8959606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vj1wx322
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so978171eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 02:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794219370; x=1794824170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/J0vDHjYYsOxr5BvnUrsz1W29IUkzETeoUB3/3KMgw=;
        b=vj1wx322BOCAgm0krtdPxDBGHqvMXo2SELpNxj1McsxFdRB7V2Rpt1oUInjZ7qbI9V
         WHyvmuFghGVNQKP/VeA1/Ihz9ycrvqgwo2wHs9Uy32joKddB+fsUAmtsNHZZPRrdTWck
         QtYzzhOVs1NhBlmJkgZkP1xdO5CeFrKYBENCfFVLQAX7Qt78QJnliyy5SF7OaixjsmTE
         r2WJdPRNG6TXkhfwFIKfeK5GhacoFGch0O+cVI2haZ9pH49EbVEGVKnq5tEs8R6WuhLF
         e/c7S6bDC21zbzLmlUhjRuGLiORmQtZX3/2pjeceQd90a9Zh9ik/UqgfludlTfieqzIb
         TUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219370; x=1794824170;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/J0vDHjYYsOxr5BvnUrsz1W29IUkzETeoUB3/3KMgw=;
        b=SPJaCr48g+zWiSKZs4JFcIpnz0CcDZ6XfjzVShHY70jmOlNl5188gmEn3etsVUXYwA
         ONlSFn8433HQMl/7IUUK5Lr7bVwd7b7Jbnsicn0G00fuvZjGfG4pQRjD2d7/FzaUveMa
         jK08mgLhHQAw0eyGj4k7KQky/uCdYTH8cnnFqiCqleak1SJ28Djs4ECmhoJTcwpIKTDM
         H1NxRMzyftl3a0mGnIu788ELd95kpm5MAu1rUVuzW1c850bNc9c7+tAbPi5ClRDhZ9FJ
         HUs5HEeZxDQG8Bz8enAS7555SyhWd7EMwYchlrm6gwsWV3+TB7Nft4mVMZ+jXIF2DNiS
         BZGA==
X-Gm-Message-State: APuU4Z9JB82ecY6z4iV97LCYAeDVokqdlm4I8qUYVvX668/PMApD+jvL
	CXNuYFjhsOtpYi98ORXTigd2hrIZ20cidVEo2fUE9wy9py+k+52Uaew8
X-Gm-Gg: AYBFou1YHcIFnm9oTgNislRLzq63qKir/OE/oF3k+h7TeFpKehFzK4f44/jtxxsLw7U
	gE7rS3sTvZKsJM+kId3VbGGloAvwouRMb0WtVNnwg/nX6aqqndgXcyPxpBlJwrSAeusXKPjOv3v
	hNdYk7dpsnY1hhvS4UKoloP59FRUZdptKRUzCFw+8CDfssP7N4Hla+vVd8LLlrsRXmSxBbcg/Sw
	7W/OqOslK89ovAMXS/8ZzvVOd4y3wQsFofKDkW4fqMX19rpcXWQ01MIfTTcu/bFpZdl0ce3BlKT
	tTnFro/rK7HdRafgOw9Oj0PPCcHPtzkjQy3yeq7sAVHvFvNUnZRlgtAsOdewHhKE88JnnbIK8W/
	jstNgLiBOvggd6rFXO4Vs+ffntSEOpqELG9BGVzTrF+tV8ayMiwJI8VqJ39Rb0mZgSl4NJr1vtT
	shmxBwaWxdWywLdbKMjB6dI8Dp1uDTymWIEN9a3lQj5+Xjei3Zc1TVzni/+1olPqOq1WOmMYVy2
	7faV8g5PU5pnxZZdkmuK+dPALjsXb6DM/CD2VT8aNpY4zJ24GZXXZIxGBMdVG9KMyYe2P5I5F/n
	0rqSThIShmOvzlhc6+tvh4sjKxnBZW5K3dZXxMK3qxcXVt0YdZbAvdk/eUQAq23Gpj0=
X-Received: by 2002:a05:7300:ce88:b0:36c:a351:fb31 with SMTP id 5a478bee46e88-370f6115d60mr9733542eec.7.1794219369528;
        Mon, 09 Nov 2026 02:16:09 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:53cf:9f18:268:d90e? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm12615673eec.4.2026.11.09.02.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:16:09 -0800 (PST)
Message-ID: <eb504790-1f37-4288-9f72-0a3d7b10af3b@gmail.com>
Date: Mon, 9 Nov 2026 18:16:06 +0800
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
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAFbNUuLXaP4_257tWkr-09n9h9yZX_y772LMStPY8QuGOWAipQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/26 04:19, okluar wrote:
> On Fri, Nov 6, 2026 at 5:53 PM Mingyou Chen <qby140326@gmail.com> wrote:
>
>> Hi,
>>
>> Don't top post (reply at the bottom please).
>>
>> I think the .no_set profile entries are currently missing for your quirk
>> (I missed them in the example quirk).
>>
>> Here are some methods to get them:
>>
>> - Reverse engineering the dsdt table (from your timi_a30_acpi.dat)
>>
>> - Or just simply print the values in the kernel code (add a dev_dbg
>> statement in laptop_profile_get function)
>>
>>           dev_dbg(dev, "profile wmi_val=%d\n", result.data[0]);
>>
>>
>> After acknowledging the values, just add the profile entries into
>> timi_a30_profile_entries. For example,
>>
>> static const struct bitland_profile_entry timi_a30_profile_entries[] = {
>>          /* Change this information if it doesn't match your device. */
>>          { PLATFORM_PROFILE_LOW_POWER,   2 },
>>          { PLATFORM_PROFILE_LOW_POWER,   <val>, .no_set = true },
>>          { PLATFORM_PROFILE_BALANCED,    1 },
>>          { PLATFORM_PROFILE_BALANCED,    <val>, .no_set = true },
>>          { PLATFORM_PROFILE_PERFORMANCE, 0 },
>>          { PLATFORM_PROFILE_PERFORMANCE, <val>, .no_set = true },
>> };
>>
>> Fill <val> placeholder with the values you actual get.
> Hi,
>
> I added the debug print and got the following values:
>
>     power-saver: 2
>     balanced:    1
>     performance: 0
>
> So the values are the same as the ones in the quirk table.
>
> After that, I added the ".no_set = true" entries to
> "timi_a30_profile_entries", as in your example. However, it did not
> fix the read issue. Here are the logs:
>
>     RAW (call): rc=8000 data0=02
>     bitland: wmi_call ret=-42, data[0]=0
>     platform_profile: Failed to get profile for handler bitland-mifs-wmi

Hi,

It seems the expected function id doesn't equal to the actual hardware 
outcome.

Could you send the hexdump of the wmi call result?


And by the way, I've included this quirk item (accept_zero_function) in 
a previous version of the patch,

but I dropped it in v14 because I consider only SET functions take 0 on 
their function id in the wmi call output,

and all devices have this behavior.

I could add it back if the problem is confirmed.

