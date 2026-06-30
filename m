Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66183793C2;
	Tue, 30 Jun 2026 20:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782850622; cv=none; b=j7V+4Il505yXb6IrK7lZuf+VtQiVRouZ9M3sp9pP7ugxBgAjdSdzqiFjgfN+GmhRiy5gYGuJLhgu9KCultlANhTasezt47goayppO4OndI9p5DObOovodd2dgRqNq6IYFefAXeF+MPYqgqItU76GOz/L1D5uLvp7nSyEerM/bHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782850622; c=relaxed/simple;
	bh=O2A7xAtdfsXUbuhfbSO9aJNRjTzqxY20Bc5lsFcTYPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5ZUbqOgI8BmwvyFEhV+xA9+7Ec3hMxCyyeUWsMHV+vnhPH6pnDYpZuPlNTIJICgsjbKPVIS1P0vQsUy41DuFcN4aRCrZykhHv+MZeMK0b25uo6T66d0jNjcKHmtSGSZb+CTSvIwfZmwKJgInHfDWrv950nL1DevSFADLXw/N7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KxNriyRR; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KxNriyRR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782850605; x=1783455405; i=w_armin@gmx.de;
	bh=2WztiSlfo7sab2Xy3hkukVwXRiLBHlhOF4f8tTynuzs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KxNriyRRKC8DRv2IsEQ3VwYtwOH9eb2EW7i1hxRaBWE6eEpVaYrHkFnG6PnkIQU3
	 1Vyp/tmMpL2L9aVgUInmmY5pl9svXh7RoNj3+77qVb6jefqa5WA062jKapYpj8vrl
	 spDROuAwbPthunZOfQGtm/KlZ9glbdSNeS3k6wxWfXD5FX9j98AqZE72c77beB/BE
	 ymOShwuuXhM8TBzkLHKN+L/I5BMIws1sEJBod+HFjyR6EbVdbtFg3CpHdm+3JGX1N
	 WK7w1Dp3XiomFVAZ1L3L5xhQ6QDh5tetoSKwl3Xq9Y8qA9ZjbGd7ILjPRVU1jQr2y
	 8wzpWhjVjMeWe+gmsA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmGZ-1wPc4S2Mvp-00RtqK; Tue, 30
 Jun 2026 22:16:45 +0200
Message-ID: <706918ff-7ec8-4288-9fc6-8ad759feee23@gmx.de>
Date: Tue, 30 Jun 2026 22:16:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: acer-wmi: reject missing gaming WMI results
To: Yousef Alhouseen <alhouseenyousef@gmail.com>, "Lee, Chun-Yi"
 <jlee@suse.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260630105033.53967-1-alhouseenyousef@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260630105033.53967-1-alhouseenyousef@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OAI9DceJKc0ZlSV3iVuno+jThYDpjC7L8N9JTrHNtTzLe/DHamh
 KGyJLSwmlFQLKjCz17crlY87XrjyYNecRwCoBTDXLxzO78c3oJiEuu+rMKjGtPD55Att+FV
 DCzm21xfSKF8vFP6lJYQuN9N+EL8ZnubWvPnK9V/hPhEjoVtyNakKbGP9jqpljQ89r+kks1
 0P1q5dGCGbC5rDQdZFkaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nlBbqdGpe3w=;OPJXKqSEY3DUDiHQtKvnh821m2x
 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
 g2K4ZcbLY=

Am 30.06.26 um 12:50 schrieb Yousef Alhouseen:

> WMI_gaming_execute_u32_u64() returns success when firmware supplies
> no output object, leaving the caller output untouched.  Gaming getters
> then inspect an uninitialized result value.
>
> Return -ENOMSG for a missing object and -EINVAL for a missing output
> pointer, matching the existing malformed-result handling.

Good catch, but i suspect that the original intention for checking "out"
was to enable callers to ignore any output values by passing "out" as NULL=
.

Please only return an error if obj is NULL _and_ out is not NULL.

Thanks,
Armin Wolf

> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>   drivers/platform/x86/acer-wmi.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer=
-wmi.c
> index e0eaaefb13d0..81d354c80cd2 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1581,7 +1581,11 @@ static int WMI_gaming_execute_u32_u64(u32 method_=
id, u32 in, u64 *out)
>   		return -EIO;
>  =20
>   	obj =3D result.pointer;
> -	if (obj && out) {
> +	if (!obj) {
> +		ret =3D -ENOMSG;
> +	} else if (!out) {
> +		ret =3D -EINVAL;
> +	} else {
>   		switch (obj->type) {
>   		case ACPI_TYPE_INTEGER:
>   			*out =3D obj->integer.value;
