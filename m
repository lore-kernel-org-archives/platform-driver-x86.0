Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDA114F9C4;
	Wed,  1 Jan 2025 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735757540; cv=none; b=umg0br1D+Pnk8Xui2ZETszalJ7YkgieTeyK4Hb2xBXjm/v3e3ccANEFNPCN1cfoQmne5C2vpl8QEag9R3+4f4jI0zjgh3DcnmGTtVFnj8Y49dU4GRLob2Rfx/hADaEBxcdmnA1qBFxCKZ/qL/KIMtv7zRrbWPblSP2ciGXhv4gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735757540; c=relaxed/simple;
	bh=88gzwe1RYaSx41GG9PYpHhUQHz8FsNgCN5dWgCqL5HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoWQmozt2/+h0IFHjXGCmf7a1VLQXFgpFSG5dT+viNOECzd/8aSP8ANOhnU6UomJowsCc7IoL2iuNetZcd5sJHp5lEE2tw673eNJ8r7nnNKq+v11+zCoymHo2ZnTkeW7Gw3iP8+3oZzbNp/5tqxrvfYk9WMx1inkBNDg+3OxKaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MtMvM8CP; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MtMvM8CP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735757535; x=1736362335; i=w_armin@gmx.de;
	bh=655BWo2yyk8Zg5TDnrLLwtachmnydLyPFedK2k3CEY4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MtMvM8CPDM0XyuolTW9PAGjzMAfApgKREPeiX2HzeXWrnLA0WAXnAcTztYGIpkx+
	 WRen6W/5u4fxpX4k9i//qrGbegimWNU0faO34063cv52LoOeJ1kLnplwpGF9G0vJs
	 ZHTp4cvQD5gCTvKCZXcyw9SJsBviSxEMIy6U46RKrzkdKblfygAqM4HqOlmyTTMVw
	 uce9QSHplUa7UwqSj8EoiZWCnEbZY6MWxpQkRlVariqeY1S6zNPa3rbU/u5AaitSq
	 kyIUeU+izRbMJVVRzPRCRBNaMGfnE4UkU3e6HhpbYjT19a6eQzLYvFObvNi+G1pdu
	 L/Jq07E9E3p/IT1akA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatVh-1u4aMm0dSd-00bZPS; Wed, 01
 Jan 2025 19:52:15 +0100
Message-ID: <df7d0307-0b21-4a58-a599-538a4ffdfd94@gmx.de>
Date: Wed, 1 Jan 2025 19:52:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: platform/x86: wmi: mention tool for invoking WMI
 methods
To: Hridesh MG <hridesh699@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250101092730.87160-1-hridesh699@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250101092730.87160-1-hridesh699@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Et/2Md1sXmRctOA8hYqBX6VUBfBuWXHoU+fUuYk0ZPd5sAaKtoC
 wFyrpeIk/Lcxchk3Q7vvTzFL1sRMO11AjkHDlMFh2yqFwu3zUuQR3NlWJVO8fa+U1SnI+FA
 OgbiLZWBdtgbyTnnpi/Pty4ewKrSTPKUTZWV0EFLJrZ+JOdTYGD649OL51d0AYADWJI2Dpj
 OBpOhfqy2Of3I+CUdWZlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q393CSOHL9U=;u4orO8bIjUMILMGZptF6Lfvbvb0
 4ASdGSHDChVd3sNY3Gy185C9ZM6p1dZ63ACwu1q2f3kUmAuJOSIf4pmXKhtGvVf39g3Bo5FO0
 UcrJwar3jmKE6ZHgR9e3F0SwwLaOALvySzxYJfy/lnyd35SRBKvJ/XMEQ2Nt0nNQxiJFUX/ZR
 bCx6WgA8DEK4V8Bt40yCHc8OxoIxR07drfHaL3TdHA8L2JsjrMRx6CCZq35hLlkUMi2v3Yl56
 mlnpKKojt4nHVQ326S6Rkx/+QRrUsr4TMSlIiTGL2SKO7rzBY/naJtL4hOxr2eU9i+SsEg39X
 1f6reuw0UPQrXk2p0PBVqVIOT8xUva63CpHo+dKCMFvv0Rh2TXHpMg7DJ026kzuQrnb6+Axzv
 GdlVYv4QKoiHPofreHuUD7dYX2tFopz/aKkeeyE5XKqulvWkCaDM8tl59FW5Wx0MlYF9pa7Wj
 3neM7FONxpVO7zl2oiwG2SWy3OxHBb00rjrFQXTFZqEXUhRdlDtu/qHy3j+pFPZrZzgNkkMhB
 bag1GkLUbqIQ/zG30B4kJPksC1Ix5yAt/+3hjK4aRbbhRFUWQ7W+CVRLmkc1rgex/Y3K85aNE
 Q53OL3o1PsPVjtI317nq0wZ19bYYSPNegXMNiSM7fTjsoypbLe45XRk9Fj/HWcDb3rQtktI1t
 P3o0QzqSGS/8mw2jpIrdGG+i+JlRMdK6IEym0GXNvhPVJatGoKGHEEGilWmzqw0QbTQxlyhUy
 xa87LDZYbDEe8puh+9Ztz6G7TP984IP6r3Azzr52SXRHURcAlztYpzaOX6qAdng+OVJaXVoKm
 UQRpERuRM+KgbjAbXRB/+O5hZFdesl2qmP9+yBwWDFrwh0MnBkx6GbhIrnIXoOcpmMeYYFglG
 Jo1RXwAnC84VCMgx7M7I3FdkSxGjRpYn3aXdyV+ucUagU9d2xSdhdVB6gExqp8eKog0xTOpgt
 gReJPpmZhy0SLRjUK/I0xaaHJn/GP/keZcDKrj/mZmcoypRxwi6K0LRbI40ixjBojpPspYVo5
 5l+FkCfb2wYEdOAILG83BaXo2XHOWD4U9NRTHtgtTGkBfkUa4yz1gV5rzvIW06HBIKmFXRe/b
 vlRze+i/wvtQSLQD7TfFjkPbsxiULqY14mitptW5d6dwcbVXXv34bfIGbl423BJmktiLvwuEo
 =

Am 01.01.25 um 10:27 schrieb Hridesh MG:

> Add a reference to WMIExplorer, a tool useful for inspecting and
> invoking WMI methods on Windows. This can assist developers in testing
> and understanding WMI device functionality when porting drivers to
> Linux.

Nice find!

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---
>   Documentation/wmi/driver-development-guide.rst | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentat=
ion/wmi/driver-development-guide.rst
> index 676873c98680..f7e1089a0559 100644
> --- a/Documentation/wmi/driver-development-guide.rst
> +++ b/Documentation/wmi/driver-development-guide.rst
> @@ -41,6 +41,10 @@ helps in understanding how the WMI device is supposed=
 to work. The path of the A
>   method associated with a given WMI device can be retrieved using the `=
`lswmi`` utility
>   as mentioned above.
>
> +If you are attempting to port a driver to Linux and are working on a Wi=
ndows
> +system, `WMIExplorer <https://github.com/vinaypamnani/wmie2>`_ can be u=
seful
> +for inspecting available WMI methods and invoking them directly.
> +
>   Basic WMI driver structure
>   --------------------------
>
