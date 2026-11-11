Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403065;
	b=y+aOa/oBoPvSOOC7zfo3/ursKepBdZNOiC30r4QAc/m6A9i6B5Omc3Ns999EXE68Tqo2
	 jYzl1C32z2BEfuqs2qELxj9TlHcY2YMrtefgjxmTwaTZtmb5ZCSLiEs7CxCSgn4oGtsof
	 fKthngDiGJicqZMfRRS/rrUsRao5A348tlM2zmpKMw+j89eBS+2QXPkdkihbpYT71rr6V
	 YIcFyVW4lyQ1Onktx3ojbLFHWIuN0Dq6spT4M9d/1Ucat8dgFwnH6ft+n3QBdKPSZle+O
	 Z5gDqFUR3jSHyBbCQm4s/xO52+WNQ+zyZ1IE0jNaqFBioR1k1N92w3Ackj0t3hiTlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UalEbA+UdH2vVrgeONGnTRJ4vr/jwZtG4NrBk/OQQXU=;
	b=1yhIN3qtvhMHaqUu9wMvJsmYR+5gxW4QkuHrx1Nmoklvcz6PKBd7SKsfPmST0VhMByA+
	 hRkXQaCjtQzyg3xrV3tnjgOzXImJzDetxFGJ1+4/Y4TlfWa1TOSdWDNFLuejKUnrlQzHw
	 befgs3Kqu0wPcBFa9UG8EVAdrThqg3PAoql7ilgwtwvU7evQ6OlAlEJPsfO8qxud/aUWP
	 2fFP1f7eEf/ApxxDo8NRc6xtbeWY1eLNc7PIpC8ImCOAIXoT77ZF+2vLjqEcnnKpi8fh8
	 6EeB4h7d7BrX9Buky2iKFNMZQBlvU4vfVXlwp0NhDyOKG4GjAIIHfoC8mILeWDBG5Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YoVvoYOk;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81949606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81949606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YoVvoYOk
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1635679a91.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 05:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794403065; x=1795007865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UalEbA+UdH2vVrgeONGnTRJ4vr/jwZtG4NrBk/OQQXU=;
        b=YoVvoYOktORAoJ2X7S3NjzZd1l+BC13wewlSZ+c7AdXep95E9SvvYucOTbSSlJ0Sz1
         BP7U+Drz7nidzoBwr6IvqD6lwhRn4ehZz8cA3gw5J7iH01rHSS6BiCXl4E+7rPQ/WI0W
         X/8rvQY4jj/HbOeXpCzh27jWM+2v1Xq1NqTpoWoKgxnknREf+APkVOPflZ523IN3arWk
         Lnd8ZmsMLslKZ5gq3qOYhal2TBsTyjMtFJOW0INbKZhR7kjfpMaLtWKy8Nc8XZbEcgWM
         kNkTE4TRHTAhFJiUyvPe62D05KlZYmSkvPLQitqio8HBypmm6Cv/crfBf4Y4GPk6lFpZ
         QjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403065; x=1795007865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UalEbA+UdH2vVrgeONGnTRJ4vr/jwZtG4NrBk/OQQXU=;
        b=BEwBLrAAUQHuba77lUJ7wLensVwOttWjURU9tGmjRPOQTJZSIwnCnXC/CIW5banOBk
         SRPpUKQAuaQVvDMdg6HY19AdFqiCnvZpLpxExZTdUxokFiLnaIDLwiyVgwL8hO2tR0jG
         0zWZl9SgPJSm4QPdjpsVWatUrgLZ55JorFUW/ZY7UVytBItBW6NdA2bhsfPwa7E4Pn2R
         yGVNJTW50pyWV5iov0ZztOHTMB7vYKSSG1c/fWrtd0jQihPHP54sI+p/SkhcIoxJFjay
         vLezqVukC6oYH/YPWmrgxsDktJ3aWqa4ZDe8HVuhW/CS1eebgTCB0EPCEh3+ub+YFsJC
         RvUw==
X-Gm-Message-State: APuU4Z/NHvwguPZYWyBXo4Iqfn4KUG+pAj8Fv2SeI9+kWxJEAoFBJ7lq
	kurdxuaewn4jh6lIznzhbBzgxavOl84OpeQM1Racaj/y6Yd8Nn3PyYK7
X-Gm-Gg: AYBFou0CZNL2+502z6Uiq5kfFSza+As3Ad0rl+yxNhQrFg+g75YCwE7jOjYjR7C97T7
	ZhPDekfiNUBxmKJfecgIxj7GZPIV6EdFmehdhW1FWGdksQI03fLtBJA2IKi9k8cKdwmGk5Taa07
	EVnnVlGWovq1nQstSe9mUFgW7DLCSB8wICf6x6AAZqeZRnoA/i59Fz1vMtG0W9wgQDXu31jscRB
	tCWhG2rJPJdFel6/+iSOj785dQuPpGYaf/WxNxOEW1JVi5N1tNyvcZiy3ycIVxcFLGIhKlcHuzU
	NbgZjWL89622p01yFMPQTOqwZSn2V+urVj47BrKYT8D067R22SiWV1H67t36rtSl/186cBzNY5j
	TdzGqahBEGWyPwUEAdyBUr6nAeCqNhA1zbbEn1KRjvEYpug0sbPuvunyukeDjTDiEihroC7fg82
	wfApwBnmJbaMS2vMxtdeaLIN2OJxEIHNH5V9A93p9YEuwognCnWPqYPNzrwSzhow1B98flPfwaH
	7ERsL97wfMB4SHL0jXDXaZ2yNl6X6I1JGQ3rnExGhyAdZ67QTlQZPVqsYx/6FEFQ/24uTQjx1U4
	jPax0gvvC0sBCJNKcmBgKnz6rvSs5oiRWAFl9wGMJkaUp0BgiLKvlhg2sTw2JElMI0gZoSs=
X-Received: by 2002:a17:90a:e7cf:b0:3b0:d551:ab2 with SMTP id 98e67ed59e1d1-3b182f3e7femr2278309a91.51.1794403064749;
        Wed, 11 Nov 2026 05:17:44 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:51a2:c8a9:6ee2:816d? ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17da4cd8csm4590268a91.2.2026.11.11.05.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:17:44 -0800 (PST)
Message-ID: <e4ad1ce8-6938-4752-942a-7ac6c4ed26c0@gmail.com>
Date: Wed, 11 Nov 2026 21:17:39 +0800
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
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAFbNUuLmaoq22pQPzrUidJ+RC2xf2u5Ovxzy5d0LQZ7owH52OA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/9/26 21:07, okluar wrote:
> On Mon, Nov 9, 2026 at 1:16 PM Mingyou Chen <qby140326@gmail.com> wrote:
>> Hi,
>>
>> It seems the expected function id doesn't equal to the actual hardware
>> outcome.
>>
>> Could you send the hexdump of the wmi call result?
>>
>>
>> And by the way, I've included this quirk item (accept_zero_function) in
>> a previous version of the patch,
>>
>> but I dropped it in v14 because I consider only SET functions take 0 on
>> their function id in the wmi call output,
>>
>> and all devices have this behavior.
>>
>> I could add it back if the problem is confirmed.
> Hi,
>
> I added this print:
>     print_hex_dump(KERN_INFO, "WMI DUMP: ", DUMP_PREFIX_OFFSET, 16, 1,
> out_buf.data, sizeof(union bitland_mifs_output_buf), true);
>
> And here is the hexdumps:
>
> Power-saver:
>     WMI DUMP: 00000000: 00 80 00 08 02 00 00 00 00 00 00 00 00 00 00 00
>     WMI DUMP: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>
> Balanced:
>     WMI DUMP: 00000000: 00 80 00 08 01 00 00 00 00 00 00 00 00 00 00 00
>     WMI DUMP: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>
> Performance:
>     WMI DUMP: 00000000: 00 80 00 08 00 00 00 00 00 00 00 00 00 00 00 00
>     WMI DUMP: 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Hi,

I'm confused with this,

could you print the hardware returned function and input->function?

dev_dbg(&data->wdev->dev,
         "wmi_call function=0x%04x, input->function=0x%04x\n",
         le16_to_cpu(function), le16_to_cpu(input->function));

insert this inside the (function != input->function) if block.

And could you test another thing? Change the condition to (function != 
le16_to_cpu(input->function)) then test the driver.

