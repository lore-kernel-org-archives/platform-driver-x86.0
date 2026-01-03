Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868281EA7DF;
	Sat,  3 Jan 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767446210; cv=none; b=fmBkrUT763qwSPRUsNHBHjEmBRdTk85cD5x94ia8z8PVton2arFsSMHZ9noWFF7nNTJ1hr9KPUJlxGcL3vDBENuus0GmIWgDWvvcvdC2kyQVQPCHSu3+or6BUO5+/fslu4lFqTE8aIsH4959uvhwS898IrLAYcRt69fUa/N6L2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767446210; c=relaxed/simple;
	bh=kq4wJh6K/Acm7gWXpciriYholiZSt5htjwCvN93c1P0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHvjHdO6gt+5zgIo3Rv9MijDn4rRuDwhCr7FLz72jabe/VisM25kX5IT5UPkL644SDN+T+1H7pKznzOjabgxmcdK9sHzOzewMxBIFGby7uPt5yecF93vPc4I9QZ1EqyzDMh3k10Gnq+m0CBoVKmvNyXmX4JI37aKDJWZJSPg9OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FlQxJ+H5; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FlQxJ+H5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767446183; x=1768050983; i=markus.elfring@web.de;
	bh=aKCZ5/c12FSbBQIVqbQvk5KYO7PYWFVer4J5laFGj9M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FlQxJ+H5nZ9ohGTE5DzCyqIu57RzDFR1G3viLhNBWrtS2EUZBTFWLdG8e3elWL/5
	 +wTVJpdPORfSWb3rUgjtc+KZReayUiZj5+RTI2/8glbM/WiI7EJZFastH0+khA3bg
	 2H0A+UnliS1D30vrYExb/eWG7RVGO+I599zWYEhWYwV71RecXCatOagCudAserkBy
	 Rq/BzLroTeQLwfHw4/e8VtXLWp81e18u95jfF6AHOv7CFCDlZpGuNUCPASBTU7kEC
	 0sOoV3H+31CEMcyQ90GEyYO45+GMvI7z7IVylJ2lC1YZ3gofziWQ7jaaZtMraEnmm
	 vwpbqgpHS1/fhForIA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.243]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mvbiu-1vvTHc4BiI-0103Vd; Sat, 03
 Jan 2026 14:16:23 +0100
Message-ID: <9d8affc8-a88c-477b-9ee3-c0ec52e00b0e@web.de>
Date: Sat, 3 Jan 2026 14:16:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd: Fix memory leak in wbrf_record()
To: Jianhao Xu <jianhao.xu@seu.edu.cn>, Zilin Guan <zilin@seu.edu.cn>,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260103122151.157174-1-zilin@seu.edu.cn>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260103122151.157174-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iFgFonBAvy4usbeElAlyc00zGOPcALbDaAD73uS4/RQQ+l7wCRN
 +cowkJ4Z5OTv+2sB/gq/BDMEDq56nUsd3DzE3sPnP7WXFXpxn4o9NSG7ZeE0vNe5YYPUU3Y
 12SKQQTM5wpCEjj2O+WLK2zWrIbw4Rc2vwv0DFWXPytrlMEZc8g2N+Wlu6XF0LA3JPnAmIJ
 QsJojVCAMcd9briAEf66w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6X7sUqvuWY4=;AmpF145D3Ctzm29Ku43GZGnOGbH
 HXTKGi2z4vPZAW+EwfxCN2+6zpyLUU6yjtHjPKoesAqAl1M4W8Ypq/sfWGII9RjQZyhEmC3vp
 s/qxz8+Qi0u5zxIwztbBruBvb7EBEN0Wp0dbQb2JLvHOZfRbIce5bkfeOMb8B6GQQ2B1xxExw
 3hGmB20o8yyvWqiFyM9Bx+YrkAhjECM/47xCVMkIjan+HF4pDY/J6z6x2tJMj9DNcrv70gAqY
 iQuMcbMRC76hcuvbdXR2JNE1NSv3vncawkNwPj/ReWZjAY5DiR8wm4d37sMpGmns5Xlxkt0pg
 CusUw+XIyMoKgSYihqv3Ch1wuQgPe2Lx8WY4JJGXddKwaftAOBDW6u61ogY8ybQS2bB48jtWU
 Sw40CgLBaRnhypSE20CaA1ljUl0g+eZwXXUOH2bUH0Q+irrA1sET44drogAz0S6S2SxNIO3C5
 CxXR1+P9BZwI+moh9pULq9SSidI8nphsoBsL7XU+FC+7QN7NKLgk6C1SkiHNk6QwGsReKanLs
 L26EDpBFbsGYOyutQEPa/qQwhVNYKbEZmROkUVXMsv34k2OiAgM4MTs8L5ysDJ1tXkDI/XoXO
 +ANyADCOVndKEhErZ56ixqZ/XMTLEd4/4V0WLQaprFoFOZeUNF0TvoaMzlL8wTXpXMxvIhI/d
 OGjyZH/V0SxXC8R1WXr0gT6TPA/oXXk48eKoP2pJuZ9o7i10I9zZjM0vo0hM3rTCMIfAOnAaG
 Wdv7AERfAmPTXZzwOvhegdMohHWyZnJt6fT8GYNr/R2vN5FbUOJ2ZzeE5mrSorKF/N0AFw+OA
 8SHVe7pbpMl/3Z8UapvkyDPFkxPNaCbOWgk3+FzAYmTAXv1DD34wjCzX/ylamcdRXHab87RBV
 TwJpXKM3fcWpVAy5mPFSfj8SydGJZc0zAQTVhD0rDbxMvgWTKY7HMiXTItRYAjMZVW+NdKLI6
 rbMbsqfsjUggwqw9/bAboUN/K4KBzqX+coTEOlYLqAuY6hSTStY977s5LHGaKKGFu28NpqjCO
 /R8KFes3cJ2+eJKEAmGNBBeC8x9Aid6Bke4k+zrWfeen+8JZHMpz35ndQczTv0CP2E0ZhrdS7
 aoHQoeWrD9w9mjHWktTjDX6FhJALgdfUWEvhXQN9nhNIW7dqak3JSbM7OkVtQzoYSi88Edn8u
 AQydfc41/mZHtPNKOZ5fcfpMUnlHxM86NPm93PcVQLLacoag/x7LAkIJaT6ejQuorKlOW7H3/
 tE2orPSWpbB8IA93/JzgjcCczWqOM63FraaHJrIq/h2ODS/rliwV2dHF8A6IBbh9huEc4Yr7R
 734HjBIF73ecZdtOHWSL3DDw895iMGkEtz057sbZ6YIwfwHb1Yb7KFBSuvq8fal8WGQBHWTxV
 UYstvMMuIrK1mORrIYe7xGH2OX5Fj+bkl7gO61ah54nrp3wn+TGxy0QHbCzFbmI6zsQhDBwM5
 40imkdtHs7ZDXPcS9sFm+zWlW1J4nrVP84Qb97CPG98tXIgho9+O5SD5PC2e4bu7Ird2rUKAT
 az3rTAXIBwjmnIORRVWT01UmqDL8nE/OKZkdCB/+E2MyiX3lOf6F8uac52fCYBwpcja9uVLkO
 WWg4dOKFtWMIHaKKQhEdiU+0UfV6U9NOABqQMIo6qXOb5pAjzx8xX0Pw3zRFj27ghevpqnpWR
 +VCMcEDp7meVDP9tfO0rX+iExpx6bji8FBrDxLG1yiuWUNPLplEqQaTudqUpyfPMuPTEfCiAJ
 oJPQYY/FxFqwunnMlki4qXlq6lOJpQs6b02+UItXsdTCYnRA+0XPmwHc/o8g9u/93iDN7w13Q
 A//1d7yC6YI23ygSU/z4sL0PeN1Yx0f/TdEaqGZV0HR4TRgatfqdXAM7M9i9S9KvD7ib7bGvH
 CfAhRvCdo/3gmdgNAVZcXBU3DvHDraPs3IaJ8q0qBSQ7V8+4udFKcgxiaJDesuBkiqR6mkhJS
 nR4ql+5c/IdozZMXRyalVOF0V+v28KY1xnH6jgnxtEMvSJOySVrlJSZ2PO8zJNge5GE1uGIKE
 yGqWWNwPpSDGZOCd9K0w9Ll9VqOhD4n5GdZn+LDY3AaLgCyDYJYehOqKSMrrI/eN7M+F/lp9W
 pCMb950GQelKjfY6FCdD4CyxmYZv2kyk7nwPAueGXyWkf52bAnADJrIUJAAEHA98f0QpB2loU
 okdxAR3gXCsEFMbr6QQnNOtZF/JL1mfb8nsg59hSDkqyG+mUQCdrAV8QP9RmFwveH3TON2JxW
 O/91jTaTvosW6e+R7QoKyKGeXQc3q1O/lMpI2w8sfi196ionVqOjSID8VNgaFqmNVumDJLsSi
 ytKilhPpXap9Czmp6vl+jQ83/BLe1tEMmGfVqDYR03eS9THl/Jw2k9qxsgTHz4fMLy/wsVoCG
 cidnPIgOoGTI6HCoUhnucVerLwy/v3zBumqDglmLfcKfM2Am+sjMRYh2Wrm1HYc3AZ9l75dxj
 07DMpcSEj71QQnuCBA3PXBuKsFahEuDN7uM0LELAIEPBSmqt3OtG2qEro75ojP2WJw526qvxO
 W8l60nT1y4RN5MRMwUL3nOWBQsap1N8rW0EUevlmG788cVX3kHmdrzRe12E5SWpV347upYpPn
 DBAXcqcubzFOd9bOq9YQJssaognX5Oaa2cZZOfN5O9UIAHS7Uc04RGrZar1n6FMOoLgsTEPPp
 7wBGPAaCIFk5fFNXop841iZzc0z62mGVrqYZk0SqhJcZdQhDEgLQR9284JgKhHf3tILoqYkjA
 TNdXWxb4MuZXwdibeFqV/fLKcqbRf6UKDA7otl6I86sTynVwCmX2FWu1kCkXAYbqkovxNqj44
 2L7y0P/j/ku026kSQ6yv1Tr1aCZtoj7DeUesEIUhyHetraVHTwdtHeYWbHUWhui4AVY93Aaqt
 KjkJe1bliauGupcF9IlQjW3Vd6eXhLZ7ws/8rKHBvaRpfi5jfdq1IOPSHk/3PUooCvJ0C9ldf
 Y+yBTcKrhXd00NWRozMj8P0gRBHGtHNKw6McEKqQ/Bs5RdUwcuPe5Xg8GoiafF/lGHDwB/sVn
 ff13BkchzgvGAGAuWqWoCdHKR9QHRpsYUeie9Qn3qBu+8UOXBMur81NHOc70z6fK/zn1xJpEf
 O8mdDglzDlS8pxBYQkgBvwfBd2L6v63LW9YBNE1yHxHDQnJjjT1dvv8oKijK53rcFdaK4M2Iy
 fxk8yOwXcE19f72VLaJPglJdZFeF/Laqu4maNs7RBu48//1anIcLTEOKlRb6HbUjFC8iwgxc8
 5NtsmdL1JK8KOK4XSRHE7rABoaPjqiAT4FIWDOASrEkvo/l8DoRtK9/OgoJekKpwbpUHvkOuE
 X3L3TCVRJBmfWiN1uBJ08LnXT3Xf50Qx11PHqK40ijxNSb4fctvH0wROPv5tCYLV6dJd/DpXv
 xaWDIlW55hMI0JpgE2r5RhkOjCuHENsbSPP13YNbVFlFZDwOb3GevU4TeSxOjLbjNXvSNGsS7
 KJxP6RJ1En0WOwevjXqyRW39adStih3MDIaONM+trdJjCfMkH6UogrJRe3f/qFCXihda11dYZ
 6L4mK/fk491aCnaCQAaYTdBh0JfRvC8sNjNsVd1/4W7y1IYHb1Is0JPhfvjvUowxQOHhUrPcZ
 bi9QHtjYTyFYzwQswbPrgL21iBROmsCptxPv36wjTkSJGZcCtSme/VetPUz+LsN18tCu+PdOd
 UhuJYzmJD4Ujr7CuiSrcZ0vCTztCPeytZhxjYpjuuq9Jj4k7RV18tA2DrlHQLjhtH+lMTRHFu
 u5XhSJtMDLQ8HgPMCkNZV3xQiCct+25bD+XIW8orU0e+pVfhzw37fYFbGBdrTu2+p//+NyqQ3
 LbCUfVuasK3kolZ7slc45rejpBf0E1QzTL9fGJNLWsqk6z6GSwl6D07/LxRL4hLnMgL4WGWoB
 lcQ/vbdwvdyTJUe3eTiF2QChVxkofG76Z3uAmlSsDjmPoWm/+nnnEaDZYMEeGvuHpu+U+Zgaf
 /3Csp+/1CWpaOw8hnlNMnkW6wRIMZ9+CacjmJ6oB5+Fykqv29IfGHCbtiAFizCdzRwrguBRxp
 jhLz7OO+VfS3298qrO/Vx1usZXm36pzUqBqhZFULbiM66E1aMPTTo5QNyje4gSjgGbKhvN4nr
 9xdXLDYmh0w0x5tho79imLLckEdfQnnB8pJ1L5CfCOqCstCuzkdR7e//BISJvKoXmJ/gvEYtb
 36Y98GlA9WV+J91a1s9rR4HEiAG4QoHldi8ELjLaNuqDf19Htn2mUBaTZX4soNfx+jAw78IWX
 6zBJkdbcBXSDyE4pddXmWqdGN8Fs7iXITIvoNSjBx13SF6ir4/GHfIrh9kOpPwZAindXQAw/7
 5XDz+xZhIKk9SDJpZlNWpv+oFfZIiV/tv/NTzYyq3nzNDJvtuXpoouOtndseqb9Tp9xxYIU6F
 X97ctYH0JRHd41Va8eAej9j8zEhetAiNEGnj9aVxoZFbcrq3DhcpQw/PMrvgaySIrRg5XzObI
 5Bo9Uq/Cb5Je3UaDA/f70Sb6G/qiusjUjYMDl2U5Ul2doHQROhyBJ/zXpHMax7MCaWjy9vQhh
 BYdm8kZ6L7LVL2goDy7iCYpe29eyzlS6HStjUS956xTnhL3pdyevtT8hCXutiZGWChCGo78gG
 Dz3dersvIhxJyclJAoXr268vlrUjkkOFiApjgrXS6nXPbiJTfSmqFoAQMkVCwgS0Rpe2y+Mnn
 1n4uNxdQ5cQhIQsc9aG1ulQufpk9B2QrdjEu67M3EsCWLh3I+dqOOnDj3TjQ0tFOBlNAj0qeF
 3flBmQxDcThGqeNyC9sOxXBxq8oBxyxQKzHAEIwrj9zr9fhvCYQIXHUAdHEfi2DwoC2aQEiK1
 a5GL7vPSBkZRgUac04khcTinweooUxi9UnlYZOF0OPdoTGTwKAFF2P0Fevy8VSK4HVHUgnGoP
 IuxVkVaIxEhmNzcfKr0gW8pUGK6AUkg0CeKwTGhA+BroczxYoV4I+3jhCGIyHZDwprNhryrHe
 NpGZ7gX0/NlvLIpJs69J7uaxA0PmgqyuMHXmJWtcVQj2eZ9+vR9ojnYJo2qAAMPSL5Vzq2xAk
 B3gDm/UWd/HJgS3K40Hvgb5JQ8MzGHXcYC7xaUYqKEeJ7AlxPKV/XdZb/v0IRdkeXDGgY66WW
 5/qmXB0+boXZEChvKyZGq+erbkqPZu3sfMUws62dOxIe8mYEa92ayY1oynAQ==

=E2=80=A6> +++ b/drivers/platform/x86/amd/wbrf.c
> @@ -39,11 +39,11 @@ static const guid_t wifi_acpi_dsm_guid =3D
>   */
>  static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
> =20
> +DEFINE_FREE(acpi_object, union acpi_object *, if (_T) ACPI_FREE(_T))
> +
>  static int wbrf_record(struct acpi_device *adev, uint8_t action, struct=
 wbrf_ranges_in_out *in)
>  {
=E2=80=A6

Is there a need to move such a special macro call into an other source (or=
 header) file?

Regards,
Markus
