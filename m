Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F261AA7BF;
	Fri, 23 Jan 2026 19:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195848; cv=none; b=dEYX3GQktk6tIP13oZ979Vq53+JtjYz1JM/woGt4DGkAOihzg0ZiX693D1+eUmNP5c96cNWkV3HCWhLbRs8DbGQvgob2nx+4XSvZHStmRxuDEgVGMnWyz2vWcVH1RCs/Qdf19aiLNW+K/LBIfLcSYvKntyF8Lc3rXzOK5NP1sWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195848; c=relaxed/simple;
	bh=aYIGL0hNq/fOe3+YvZE/s3N0bkMmp7Lqi8Cc0Nn/eZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lIggzO2TM/1QypAqyRT6wI5JbR6q52xsA1smfGdH/L6sVeYtFJ1dj0zwUFU0+2GvLZXpDhxqh3HgUm/n1thn2EY0AX0nozA55MdltZBJeDj2gO7ZbnpMDv0QNYGCPOso0Ly2NE0RC6FXSIPCGwFyDR4vLaWo3DpqcDb4sLqOuO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eNw73UWb; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eNw73UWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769195836; x=1769800636; i=w_armin@gmx.de;
	bh=vIwGcj7ZdvaCLM2xlgpSGdeCmKP+wk65XTtRSoDN3I0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eNw73UWbotFJH1XPtMVtmi1MXVwD6b9j+W6HPIqW5edeR9W0clH4aMN4fEIB1nSm
	 oK4NCyv8Iv1kJKAESBx8lsIzOyfgG6dXH33qfuQjbF0CXQVdOiTpX8EmlrhrbvjMr
	 nDweuDIANYtoiRi3lZroU2+E6amCtI7gPj/GbzPcQsY0N3iEst5f3mHhDNe/2pV6Z
	 aAW2gwQu02Qr7wwW1rfUHYbTglF+yEI8XRpdTkSV+QBdvDnX+qVgnwiVlq4JNQp7S
	 UrxjQgfY2flPjYEw1eXL5cymobVa8+4OGbQohgzKXuIo6Z+PcKIr12YWJmuE1eSTG
	 pm3+9BY8tLJXojGbCw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGRz-1vQKlK2TGP-00NuRL; Fri, 23
 Jan 2026 20:17:15 +0100
Message-ID: <218f7a67-9be2-4094-b400-1cfad3fd9d0a@gmx.de>
Date: Fri, 23 Jan 2026 20:17:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] platform/wmi: Add kunit test for the string
 conversion code
To: Nathan Chancellor <nathan@kernel.org>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@weissschuh.net, Dell.Client.Kernel@dell.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
References: <20260109214619.7289-1-W_Armin@gmx.de>
 <20260109214619.7289-5-W_Armin@gmx.de> <20260122234521.GA413183@ax162>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260122234521.GA413183@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Fqsx1eOjdnh+HC8OdJAqpt8fXbwQB9TBKwaFKiI0HKNI+Q8r7mt
 kCB8ZL1vboz/VJ2Z+j4dkHouEgHPe1E24n0lg49l5fRVHn+RsnpXv9acaPHAbUXhMAVhGVi
 b0cZby950hgcYZ96YatzYPhqVg60VmhAZC9zJeWgvHrsAyDw5/qoLDfg7GYsqleliifP+QY
 srC4pYehZJGmT2UWkWSMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1pvuykjE6Gg=;DMXcgYjn58qZ7EIEnLV5tFXf+JX
 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

Am 23.01.26 um 00:45 schrieb Nathan Chancellor:

> Hi Armin,
>
> On Fri, Jan 09, 2026 at 10:46:14PM +0100, Armin Wolf wrote:
>> The string conversion frunctions provided by the WMI driver core
>> have no dependencies on the remaining WMI API, making them suitable
>> for unit tests.
>>
>> Implement such a unit test using kunit. Those unit tests verify that
>> converting between WMI strings and UTF8 strings works as expected.
>> They also verify that edge cases are handled correctly.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ...
>> +++ b/drivers/platform/wmi/tests/string_kunit.c
> ...
>> +static const u8 oversized_test_utf8_string[] = "TEST!";
> ...
>> +static void wmi_string_to_utf8s_oversized_test(struct kunit *test)
>> +{
>> +	u8 result[sizeof(oversized_test_utf8_string)];
>> +	ssize_t ret;
>> +
>> +	ret = wmi_string_to_utf8s(&oversized_test_wmi_string, result, sizeof(result));
>> +
>> +	KUNIT_EXPECT_EQ(test, ret, sizeof(test_utf8_string) - 1);
>> +	KUNIT_EXPECT_MEMEQ(test, result, test_utf8_string, sizeof(test_utf8_string));
>> +}
> After this change in -next as commit 0e1a8143e797 ("platform/wmi: Add
> kunit test for the string conversion code"), I am seeing a warning from
> clang around oversized_test_utf8_string:
>
>    drivers/platform/wmi/tests/string_kunit.c:108:17: error: variable 'oversized_test_utf8_string' is not needed and will not be emitted [-Werror,-Wunneeded-internal-declaration]
>      108 | static const u8 oversized_test_utf8_string[] = "TEST!";
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>
> oversized_test_utf8_string is only used in sizeof() in
> wmi_string_to_utf8s_oversized_test(). clang warns because sizeof() is
> evaluated at compile time, so oversized_test_utf8_string won't end up in
> the final binary. This is typically a bug since the developer may have
> intended to use the variable elsewhere but I was not able to easily
> determine that in this case.
>
> If it is intentional that this variable is only needed in sizeof(), it
> could either be marked with __maybe_unused or eliminated in favor of a
> direct 'sizeof("TEST!")', depending on maintainer/developer preference.
> I am happy to send a patch.
>
> Cheers,
> Nathan

Good catch, it seems that i forgot to add the test case that was supposed to use oversized_test_utf8_string.
I will send a patch that adds this missing test case, fixing this warning in the process.

Thanks,
Armin Wolf

