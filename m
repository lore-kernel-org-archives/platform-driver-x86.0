Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6E72192F2
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Nov 2025 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762273000; cv=none; b=remtjqdikBuF7gpFcpHtEzH0sNZ7M8JuFpzdORWd3YOSgPNGVHLbIoLzKGgW4Ydir1mORErnUwHo7LTa4nE6TDDSAAhMvQ0xuv2c1FWLs6vLriNxBD/0uaGBIjrmjobN3B3vn2updv5EfQMP0+NBVkv0TUUAxDhOUAr/sDrayxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762273000; c=relaxed/simple;
	bh=LtMhAHX1jtzCvhZLFV5nAlL58ZyBXOqpcvxurpOdyqY=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=mkWPWdKcWqmuIwPFzos5XJkH3VBBbA5zrJjP9wh59hzXRoQwkpCVG7I00n8DEW7aAm4nQh28bVduWN2+FWeO0t33+mLo9/aHwz7m/2yRR6Jc/WHf5UPPwV69eLkj4OfN4eyYoAE5nrViojMNvsSZAHhBnQ34DnXMdUPqM3NJGIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAig8+7W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAig8+7W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6338C4CEF8;
	Tue,  4 Nov 2025 16:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762273000;
	bh=LtMhAHX1jtzCvhZLFV5nAlL58ZyBXOqpcvxurpOdyqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SAig8+7WNNFcusp/CspPI5CYigvIcq0V3Rksxbe+W4ORHkXD9F+t/j8GbtfC3Yqq1
	 UEdXThbkouuY1o48FUU80g4SKC6Zt0H+wCA9fJ3cyttQFydnxqrj76XP27ioQ58pVn
	 nM9A0SKAPhYFpRub6sSdYZMd6luQv6f4idRmNPhFw+IuVJ6MjJBy1KRCKhPcilS84l
	 78iJv2eHRUuYMu728umRDkbmLnk+xQu9djHLNUEa3J/xcReIko9SIIBqTfWKZwb/ft
	 aIJUBCwKHmW05OD4Fd7EEnDhdo9anKO4Zs3HxSOdDKHg4gdrqHJCax083YGm4BiN6+
	 WDLJv/Mt6aMfg==
Content-Type: multipart/mixed; boundary="------------08w3coA2wTd9HxMwM9z3Jy8p"
Message-ID: <9885395c-fbf0-447e-a9b5-2231a3071dc7@kernel.org>
Date: Tue, 4 Nov 2025 10:16:38 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Lars Francke <lars.francke@gmail.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>,
 "Shen, Yijun" <Yijun.Shen@dell.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
 <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org>
 <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com>
 <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
 <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>
 <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org>
 <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
 <089b2cca-4c84-47b0-a96a-0363ffd642d7@amd.com>
 <CAD-Ua_gxPsTbG_3shtqAZX_E4ns5hHPZbTszQAXH2jbfLxP_Rg@mail.gmail.com>
 <eee498d1-6c12-4988-9a70-1e108848da62@kernel.org>
 <CAD-Ua_hX_PYxYUfFDcTv3R4pV0s5ninRSK+-1zxtttMhSPoQtg@mail.gmail.com>
 <c31b5a46-5dea-48c6-bfe9-b3efc989f0de@kernel.org>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <c31b5a46-5dea-48c6-bfe9-b3efc989f0de@kernel.org>

This is a multi-part message in MIME format.
--------------08w3coA2wTd9HxMwM9z3Jy8p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/30/25 8:35 AM, Mario Limonciello (AMD) (kernel.org) wrote:
> 
> 
> On 10/29/2025 7:22 PM, Lars Francke wrote:
>> On Wed, Oct 29, 2025 at 4:38 AM Mario Limonciello (AMD) (kernel.org)
>> <superm1@kernel.org> wrote:
>>> On 10/28/2025 6:45 PM, Lars Francke wrote:
>>>> On Tue, Oct 28, 2025 at 6:12 PM Shyam Sundar S K
>>>> <Shyam-sundar.S-k@amd.com> wrote:
>>>>
>>>>> Can you try the attached patches now?
>>>>>
>>>>> First patch is the same which Mario shared last time and the 2nd one
>>>>> is on PMF to handle the .restore() callback for hibernate.
>>>>>
>>>>> I have tried this on 6.18-rc3 (though this should not matter)
>>>>
>>>> I just did and I'm afraid that the patches made it even worse for 
>>>> some reason.
>>>> Hibernate works but when rebooting I end up in the console, the cursor
>>>> is blinking but I can't do anything - no keyboard input, nothing. And
>>>> what's even weirder is that after a reboot I have nothing in my
>>>> journal on that boot. Not a single line. I have no idea how to debug
>>>> this behavior, sorry. Usually when my patches broke the system I would
>>>> still get logs. If you have any idea what I can do to debug let me
>>>> know.
>>>>
>>>> Thanks,
>>>> Lars
>>>>
>>>
>>> FWIW I tested Shyam's PMF + my CCP patch and didn't observe this 
>>> behavior.
>>
>> Thanks. I tested the patches on 6.18-rc3 and I observed the same 
>> behavior.
>>
>>> Can you please add this patch and see if it improves things?
>>>
>>> https://lore.kernel.org/linux-pm/5935682.DvuYhMxLoT@rafael.j.wysocki/ 
>>> T/#u
>>
>> I tried this as well, didn't change anything.
>> I'll try again in a couple of days with various combinations of
>> patches just to make sure that I haven't made a mistake.
>>
>> Lars
> 
> I have a suspicion.  With all those patches added (mine, Rafael's and 
> Shyam's) can you please try to hibernate and then after resuming run:
> 
> # rmmod amd-pmf
> 
> And see if system hangs/reboots in a similar way?
> 

Can you please add this patch to the other two and try again?

Thanks,
--------------08w3coA2wTd9HxMwM9z3Jy8p
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-crypto-ccp-Prevent-calling-psp_tee_process_cmd-with-.patch"
Content-Disposition: attachment;
 filename*0="0001-crypto-ccp-Prevent-calling-psp_tee_process_cmd-with-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0ZGNiYTM1N2YxMGIwNTU4YmMzNmY2ZmIxNWY0MjEwYzQzZjQ0ZGJmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJpbyBMaW1vbmNpZWxsbyA8bWFyaW8ubGltb25j
aWVsbG9AYW1kLmNvbT4KRGF0ZTogVHVlLCA0IE5vdiAyMDI1IDA5OjQ1OjMzIC0wNjAwClN1
YmplY3Q6IFtQQVRDSF0gY3J5cHRvL2NjcDogUHJldmVudCBjYWxsaW5nIHBzcF90ZWVfcHJv
Y2Vzc19jbWQoKSB3aXRoCiBpbnZhbGlkIHJpbmcKCnBzcF90ZWVfcHJvY2Vzc19jbWQoKSBp
cyBleHBvcnRlZCBhbmQgY2FuIGJlIGNhbGxlZCBieSBvdGhlciBtb2R1bGVzCmF0IGEgdGlt
ZSB0aGF0IHRoZSByaW5nIGlzbid0IHJlYWR5LiAgUHJldmVudCBmYWlsdXJlcyBieSBjaGVj
a2luZwpmb3IgYSB2YWxpZCByaW5nLgoKU2lnbmVkLW9mZi1ieTogTWFyaW8gTGltb25jaWVs
bG8gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5jb20+Ci0tLQogZHJpdmVycy9jcnlwdG8vY2Nw
L3RlZS1kZXYuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlwdG8vY2NwL3RlZS1kZXYuYyBiL2RyaXZlcnMvY3J5
cHRvL2NjcC90ZWUtZGV2LmMKaW5kZXggNjY0NjhkZTA4ZmMzLi45NzJmYzg0OGQwZjIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmMKKysrIGIvZHJpdmVycy9j
cnlwdG8vY2NwL3RlZS1kZXYuYwpAQCAtMzM2LDYgKzMzNiw5IEBAIGludCBwc3BfdGVlX3By
b2Nlc3NfY21kKGVudW0gdGVlX2NtZF9pZCBjbWRfaWQsIHZvaWQgKmJ1Ziwgc2l6ZV90IGxl
biwKIAogCXRlZSA9IHBzcC0+dGVlX2RhdGE7CiAKKwlpZiAoIXRlZS0+cmJfbWdyLnJpbmdf
c3RhcnQpCisJCXJldHVybiAtRU5PREVWOworCiAJcmV0ID0gdGVlX3N1Ym1pdF9jbWQodGVl
LCBjbWRfaWQsIGJ1ZiwgbGVuLCAmcmVzcCk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsK
LS0gCjIuNTEuMgoK

--------------08w3coA2wTd9HxMwM9z3Jy8p--
