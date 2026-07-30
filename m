Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFCE2CCB9;
	Thu, 30 Jul 2026 16:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429800; cv=none; b=ZVPhOniZ7VHbvR1W8PM+wyM5pb9ZLK0A6mWquoJEpmB39uGV5qcD0BKmIHRC8tE0oPlebZJKF+oU0ti6ZS3pjOf0i+YrN5+6E6MmqvyhBdEFev9TanOU5peCr//U+0JQNwPgXpuwlzRhXdC65iKFr3XE0Ev0IFzpqHM8OBrM6K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429800; c=relaxed/simple;
	bh=xLwlhJmskGRgym2dcmSR83vO9oTQfxaKBclSFHjpUgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEZMgAbEzDcc8AUiR/V8kmme7L7SONFXiK5eJSLX+hdhwB0u/jWpYEtkBYYYCBr7QAuIqxbgRCfwCyyoDQz6z01oyZZFC/dHhW4fth3jy3ddZliswUlGcr8ZKN3rmkFhiY283i+Wc3WOzKKOJNl/P07iUsJYuyWPMaKXL8hZ5gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Q6EOK+Hz; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Q6EOK+Hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785429795; x=1786034595; i=w_armin@gmx.de;
	bh=qgKth10rLsNJX+5amvhvqH2RT8WHTTwGv8OWeTnVl/E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Q6EOK+HzhoVUfQVr4pZu+5LkpAP2/ofsA7afatjcS1b70R3En706xDWR54r9KpbK
	 7E7U8Hy+jIKZaasNrstHNRLQUlW9ch5sAPdRZ0ctJ1q5MaEvZ5JrnNCI4pFwlcYUi
	 2BawaYQTQVrqx9YHWGvbNxQFb5h1buZkD/5ekl5i/7izNiA+O7xz+BGU+U2Uaczgi
	 gdQGE0yAOKbAoe5/3BTOfzsNH/GGPazgRHH6UXQQgqy8LMZJTPQPFEgwQuvxOzRA2
	 j50lqDjIV2FDws70/XrhWaYBXI7P1445UvOLirdHu/JPgw6tZQ7GZEh/BSFJwgdEf
	 zTyGb6WOdl8YvFS8Pw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17UW-1wvYQz1vCc-00tKms; Thu, 30
 Jul 2026 18:43:15 +0200
Message-ID: <5c600f4d-a93a-4410-9183-d33b7f6f4fc3@gmx.de>
Date: Thu, 30 Jul 2026 18:43:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] platform/x86/amd/hsmp: Add HSMP client support for
 Family 1Ah
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-2-muralidhara.mk@amd.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260729164034.1331375-2-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:C/KGtjNx0t+mxlTuiZAgUIjXfvNE9Ac+ZBXaUuRmzPW9SFIHphd
 w1LnT4wIq2O+/RGm6vNDf7ATBGB6hRN8QycZyeQl/iM+7NozVqr+MmwGmcb4dwlKXFX8klx
 l0pjfwahHG4pw9i0YO7Oe9COYlNrkh5xYPBzMDDu5tXoi0w/v9hMFDyxAu/s59QjMjHPmay
 pCSyLythINnPorE6SHV0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4uv5d8UxFz8=;vTBd0EZUgAHJfzlrw9YfzcopADD
 NnHahhu0KkV/GDZJlKHAMyT0elSLzwui46IP9tvze/qu/TIuMC1a/9AcwszaOnx8J1Eakoi7v
 T6PwXWPxsarrqB5sSUbtvk82886qcmUjnzsrHjHHrHW7AGGxye4IB1vZ/kxWuc4ZtFGzDN3P1
 BodTjxlzLYxTiSID2BaqHgoqz7+f476NM8PFQ1MRUv0DGMHytF+CnvoHOfzSonlc06Ri+uTCg
 BxSf29TE4IPeLZj1QiVYcdFK7aL7PNLBzMRX80b3SBn5xTIQcOGiqIdE9G3/xWhrPQvNOUt1h
 3iSqU5RoIkm1Wl22mMP55lOsyEG7yzIsNnzA59sid+/P/TXaTO/QLW2dWIdM9b4taW1s4Aao9
 7YCQP6qF8g037ud8yEo7vvbdGiS+qxm1hThNFGm4Sb/zVyz6L4KWSERxYkdLxc+IFwHqKVgIc
 Vw5RP9oiDUFvgvQP5uMi9lDO/uqj7CCSAPNZYn0BPcA7BKmU4F27caAsDK3wJxR+rtW+CdTnp
 5H7hUP/2GzwAxJUdvz1yAv6c55S0EBo+y6VbmBXtC+7aAiLfGPOsVRsJ9faOEd72CvI7758bK
 dFIV0I+ulVyc8vypL/5eGzzbS6faGf2YgdilSh/86oCVjJvxoXgJUzCDZPSL+4VDaw1gY9sb+
 Y9v98K6DXVGzaqM9OZ0jrfnb2zR2tE6nr0VRITUbSW3Nbl2cA2m17/mDqaqf8WtJyb6jsI0eI
 aJQlJ0rWgos56BoKPvXSB3v4Mt1bsddabhfQAMKhGH0I+5P7gwtv8UvxyJ815TbKdUBs3QmU3
 4FWwlf7cmVgfXpvWuMthBmcO7nt/biFHKpWjaetFAfEGEkfPDFGWf+E4lpqeZGBmrEOMysU5M
 PdsboXbXPG/jSAapyBHP8CgvifjbeXi1FIzo3xyvNdwEqghlRED5JdfkT8CqAgypSvFR96g+I
 ++bnSJ9LVyPFGIHQFmfdeC7nRUnzDWe1hDmRue7XYxsn4AcpkX5JSjoCNfVx4v00qipyONstr
 /AhuY5ASYGE7eb/YrNe2IWwwbL70FiTeHjfW418OIFbiAPNRBOM+aNgkHVD3QtNpE03NCgTNt
 EWfInRvyKaaZPDLs50rAy047ar/oVity3gJe++hK8gNYJQnZytdsNg2OVLTAIR/tukvxYQxK5
 91tKVCG1ltC6hKZBpdey+UUh+xNQiOGw9y2bK8pnvOyweYFkFoJExZqKVi7Vx1XdOp7H+rsH9
 t8mFyo5+1gSvNBATQa8CbViiV0U02/cug3gN1FhFeTYJ4+kzCb78XOyClX6i9js6v6xKvwb2M
 OW+FR1s1rgjQTc4khmORYAsVGVkA1qk83iUES+70cRAsf/oOo6wVXAOFHzyN/GN+UeaKzYw4d
 2Mc8azt8QMc675s6SMxcrgZfUIx9w7LCc7uAHlhRBNTeUWPH4DpVaTDc4BFTXj0IzQCpK1q6a
 yv0uiF1eo3dv5CBIA1YEuLNqUKZrtAuav22IEL0un1Cs7siKASHN4E5hn3+hmxadhXSoWy22Z
 DiD8vORuoZMPmmlvmTXUyoqEq2k4sNc1SY8xF2nq+zH6wtckS0uqq71eFlK3oAlWFqqNPR2rP
 N4QpSy5RomDejva/0on3VXnxig0dLa7FQBX7NQu5gPeBR05DR5VgMHh/3sbNkkTW4kd2xflqd
 ZxEI/TfAiOwW+71Pg73Jczp+XQyo93rurJL0VdadLVQCA3FPaXqr4v3yiFOuddstUZslQplzz
 DGlvC3vsPFEeQzW/9kGh74v+iKlharlVYYlw/Bx+YQW2DO1fu6RfABF6UcjR6rOKiC8GbzF+C
 87o6UDH9bVKHHPC3zjGNm/u2+ip4pTN3LJ7UAk2boPDoH0211hcOUTO1SFbq7xiieaasa1gHv
 RY6OLfQge4U3Dpmys+DvjPqCzJTN6/1BBUyYkQD/Dj0QCtv0xA5Ky1unUNYtNmWRqTywL59o7
 rM2xY8DhzhynXdM+/pvU4W4DYyhe5ypv0WvOQpmZWRAHHBW9KEQTfKlUU47+0nQuOxl8j4saQ
 iLjFWxcRDronZP/orCvFww+DTpkKo88H0ICv9j3pa4A3zovZvAYmnB9IOxzk1jyPFkroD6Hcy
 yYZcIwigONeMq+OZ3BdXHVxmjnaiEtXCG6iqB/Qgn38AJPMjicFitKCPJaaOLM4yosoDxSA/h
 UY2+cXxj9o8jNX1pODUAZu/5lrTi1ek0/kwIuItJI6n1d9aS17WuKkva/lsdAp6cmlQCq7nMP
 iayctPip7uJa5vRni0VPSgrdeT6MCEVV0Fw+6NzZxmMSRQC1fdLD+sc1SoQtCxm53g8itiM+V
 F7WBaKN6cf95NdoIt6NXPPpSfaExJgsvZcUM18GKDcJ3osChtwD3xTnHeBTZItkMpFycEpoJ9
 8Zen7sD5ypBnN7T4+anckoUFr40k0tpvk1eGyaEUIxDcCgmq6pdviKOWzAM9UIRXOUNPeOUXj
 prYKOPPzSvqCKOuw8sAyhP3ezcCTfSr/dgc1UvVzHtgQYdNZzIKw5pZ4B6IxP8kYE4VQypcIP
 hknZw9uuVDDDPqa8C6G+Z97cvvsmgMYmiFrOL63YK90rHUhKVsZk1lN+F9aVXL4yzlQDnJaNA
 +Ebf5OAepEOe8jkv9oVwWWe+xhUM0nApRaVtR1Gf3/Gc6dLB28dVqvDzfZ77npA9g8YJQPIJN
 kFn0KjvdZuvo/HP3u+9UCDCLB2+lPXGpWcuQq7iRLe6foeO9r0e5fg5JUHsXBjiVrBsfuftLY
 iDMf9oplF8a6L0v2dfer0OVArc3Lz+5SU+D0droyGWAtcCMOBZ7JNdE7y5z8Ws/1ycD1lTxRU
 HCBkI8+bGAczwfvdhIyUOSHTzXnLZyXNAetcwAWnps6VlTAdncweFzhzHY2+a7GEgif0ZnNYD
 CHII58VFV9hdvWMD+s5jytpCxleMfhp+/p7YY8PV2trmj7OZJdEwNKGsTm/Qtrik0dyiqBB0C
 zFMN8fKa6lx5AFsjzplM4gZE4RQ21hDNtOe8Fj/H7ewveXGyJlMettgD2oLUVGqenKxJN5j0p
 1v+C3modX8BMj/fHV2E+2SmL9sGSGFbXNzxnOmuOyjh3bBt+HN8m3sJMtteT4jnsgJR3/+RwN
 iVBUVpAx0kX5Fif8c4DNtt050/VYRtx2KBeYz/KmcoEsXHk5RMBXXp0lT/yrRdioKf1koF6B0
 71WePEGKcHZTIsRgWz306unvNQ+6jVssOos5eQFQSH5wbpjtntQ8pTCjHcuR+RUj2DDHHVyay
 24te/txF0qdiTdWTDahkcAE7pkDl7MxV/H8QKuNZ+ilFgCQLy0wQuA0xZTjpG1Rez6Q4GrGte
 ZvT1q5NjUbfQXsOQ+OlUx1jcK9hnY393hnhkyz4bcf9vmdBbzElRk10RCLN6WUIYmmxlo7tnq
 k82xNaOJbSvp2XQLJGU7ClEjbKuWCZ5n/2FYqONNGTd36kWuBFM5gBzhdK7xQ80H7YD13+kaF
 Xk06KGKlOd+7AqQApvCP3asCJLCpqTepgpNfSKRYduZ9kvBcq/cfdEvlG2kZNtWMFtIEssZyN
 2KH+dP7+uFx/CfdN+FzzR+SYsf+nU9HLsyZtcy5ojhDSleYVbO7aZT0CAo79Q0RBrJDkSsfiM
 qHKbyxaZRNJQfg/8rVFiv+4qvZWMSSdepryOJEk1g8lo7VRvTEqNB6lB2V8ga/ginuJqYcXTu
 UW28QcvGwjEzX+8jWdzebd9uvN6gVdGg+pMHD+13aTq/wtsk65HlbKUR5B4P4V6CYGn4UyRxH
 vlLLbafa6+FtAFrdSWAfJCiGjO4xQCG4coxkPHBQO7H4a1CUtOnrDT/S4wKc57D/h3k76WXu8
 M/KKwdrHAWuMT0L0yE8jLK1CCep21LFuGw2DDXm/9at92EqhNMESkmaqgS/LzH3c4dXhvhGMw
 pcV0tACxACZquR7A0C1X6H82yWqF7qam7ZGwN0D+NxltGP2GRYkWCmrNJlS4VeCEMXIO+gRD0
 KQwHLRtNf40AsXlNhp6n+6W+k5sJQG2auAdvQREk3s5vTjXh9RG9uxUbQ3jEtcVN5hqVaI3WF
 uAzRhGnWlmtrv6NlfQxVj3Cv9fjVB1TimB3/HPgkCen+bNzG7OaxpDnlosqGmqIjSi40aYC66
 t0EdAAA2HIW1y8NDRLC6hd6gjnsP4gu+OQxRYeK6i0M2UF4RCL9PsN0OJd5ApKamC8RGyPdYa
 W6IdVSmzNilVFCGL8kasXiU1jHPuYdTy4G37PbJgPaD9pYFkQLLmwj2JDjQH7XvcVk2RPAHma
 ZHOCBmAMB54QGJUu62RApX8C9ZBb27TRs65rTXCAagQC/Q0Jv3PR49NhpI9mmpy8QsLgPfwDI
 +ZHTHBDDrkL+o7a3AkRThpdXT8m33hKs4rST574lWwZJ89WS9kin/k/dHuK6c7zmP6X1KT05u
 Y4v0vXjFT++dbEK60HHazWVbmZ+iaWRuHsce84Idh4Vx2o86QGRoVdWjWcQO6Axlh9+Jt0Tsf
 cm5kFecCV6rHEtEbDhu9bs/kpVoLetFzq/SLtc2m9VE4gmuxbbGX/0rszLMUFU+yf7lrE3EJw
 NXP86lJMygp36qZ23yCxXb4tMyG+ApyxUmnOjjOVMtOGjprK4+63EnK7KtDAXv94HPORhuL4D
 h3mH48PNKlX8lMnHvO0OYb5EFSnOyGu64mqcu2hfjQZqkl6dxeCGs4gpKFUTY9J0vo5VG9YrQ
 k/WnVFCzNRi3dMU8KTfr4kh7wNXn8CirZ9b5qbgyIigptV6vrDece07SDIxg/TGK1c7ybwh3r
 iDybyKUPjHDxOCwZSFPFmmiw11vp3gf+xBLydUyj0wBU7vyAkziXdU7nfL+dGuCaLCUkL3u2L
 YuhTiF0dM/X6qnAZe4k4O8ulRksUSTElKJQ+AcHjLVOCOG7egRrL/FrRq3ZLDlSsJ4Zmc6yA9
 hUcLTrfMgKE9u1M+FDTCtpSecYG96fPUAGqcoOEcEHK0qtDziqKDpS6H0Wnkc6qoYF41WNXEP
 m3z6bCd6VKaqsf40YE9JhBHsGlZ2zPi10G5yTv4Vd8FlsHKZ61OI3oF95dTrXvPryE7KlMkRk
 dZF8BrQddHwYe+o4TofgkVn3j05khRx8tdfFdTOTR4/bjH8sNzjvuvkfQlrQBY5l8dHbA9jn4
 6PIC7vKkdkNlkUtE4xVs1ziAhCdSx4RPUfO6HXZvC9nsaPhwSH9QVlnA42S9a/bs94eWkryFb
 1URBiKC5p6ibDoQOdk48WwHoIXiovNQrrVIefEsz/kdc06CXXLSQKs4O1tcnVhcjM2Ds9VkoS
 E4y4w5Ww3zw8HbInpFUo2iwHLFkp14U0ufa32rCWDfQkBCeN0W+D5ThSpUYW/zkp0yfqsDJLD
 2Yt4xXiizjwFNExP4wpagLkqwm1x428eJfZYGU0CvPHNvxYyNPLN2x3lp9rLi0DVw0onoYpiu
 9CN2nUlrmLWcqSxMSm5kN4KgwZwxIggScJuMiL97d1yzOaYqrmdX7mnun9z9fnswy5n8je1ci
 CoQoFVpQ31Ah7XxMWqrxk87kWCViUYP6dz1RfzfZQv5wfGc8N+NRudyos140k0y3dCKLsVVKG
 2lfY+PNp4X73KMADyNBb8W0auhhD7EidXflYSx0NCQTpWRcQMr5/209qtYHsrR8f6JQvX8zFG
 JjRfHx3ahtwK/a6q26jABUyqyc7tD3AZ6/1FT4OATHES/ucae8njULvkfnOliTABWY/TvHp53
 OJXqDZKOO2F6ukN+1xSpUedJiYqXKEErT8EXWZ0MG01ASDG56xsuTfkPWW/xgzvGsT6GMNlpm
 0RnvpDfL7pqiNiAly/lZmK6Qkx3P2ZNSxCwPkwRSK7f616h744gt4yU2B+/NkjISaruf1w/cq
 sqcaiuG6SnqAbhwZvyKfP1NM6UNSMvQAVVQuI/EMTyU41A7uOfR7Vy7TuzaUouNTtmaQaC0mY
 vqvMqYyaDm9dl9dPUxGawisR+dMFjztTkmAfE+oCum4rJH1sS0heWmktRLe7AHAwLxi

Am 29.07.26 um 18:40 schrieb Muralidhara M K:

> Add non-ACPI HSMP mailbox support, Ryzen Master SMC client message
> descriptors, and platform routing for the Family 1Ah client platforms:
>
> 	Models 80h-87h	Medusa1
> 	Models 88h-8Fh	Olympic Ridge
> 	Models E0h-E3h	Medusa2
>
> All three share the same client mailbox addresses and message set, so a
> single is_client_platform() predicate covers them, and the two adjacent
> Model 8xh ranges are tested as one.
>
> The client parts drive a different mailbox from the server HSMP
> interface. They expose no _DSD/_CRS to discover the mailbox, so the SMN
> addresses are fixed in hsmp.h and shared by the platform and ACPI
> probes, and they speak the Ryzen Master SMC (RMSMC) message set rather
> than the server message IDs. Add that message set and its descriptor
> table to the UAPI header.
>
> Two message descriptor tables now exist, so every lookup has to pick the
> one matching the running platform. Rather than test the platform at each
> lookup, describe the platform once: struct hsmp_plat_desc holds the
> mailbox addresses, the descriptor table and its size, and the IDs of the
> messages the driver issues itself. get_hsmp_pdev() resolves it, which
> both drivers call before they bring any socket up and which runs on a
> CPU that is fixed long before either can load. The server descriptor is
> also the static initialiser, so the message plumbing cannot reach a NULL
> descriptor even if a future caller arrives another way.
>
> get_msg_desc() then indexes the table behind that pointer, and
> validate_message(), is_get_msg(), hsmp_ioctl_msg(), hsmp_test() and
> hsmp_cache_proto_ver() read the bound and the message IDs from the
> descriptor. get_msg_desc() returns NULL rather than indexing out of
> range if a caller skipped the bounds check, and the Spectre v1 clamp in
> hsmp_ioctl_msg() uses the running platform's table size.
>
> In init_platform_device() the mailbox setup becomes a copy of the
> descriptor's addresses. The F1Ah M0h message-id offset stays behind
> is_f1a_m0h() as an override, because it applies only to this non-ACPI
> path while the descriptor is shared with the ACPI one. It cannot disturb
> the client mailbox: it requires model <=3D 0x0F and the client models ar=
e
> all >=3D 0x80. The server mailbox addresses move from plat.c to hsmp.h s=
o
> both address sets sit with the descriptors that consume them; the values
> are unchanged, written to the same width as the client set they now sit
> beside.
>
> Since this is the change that lets the platform driver match the client
> models, it also has to let the client probe survive the interface-versio=
n
> query. Some client SMU builds reject HSMP_CLIENT_GET_INTERFACE_VER with
> "invalid message" even though the mailbox works, as the test message
> issued just before it shows, so treat that failure as non-fatal on the
> client and register the socket anyway. Nothing on the client depends on
> the reported version: hsmp_pdev->proto_ver gates the metrics_bin
> attribute and the protocol_version sysfs file, both of which describe
> the server interface. The query stays fatal on server parts.
>
> The client descriptor table carries __attribute__((unused)), matching
> hsmp_msg_desc_table[]. Both are defined in a UAPI header that several
> translation units include without using the table, so without it
> -Wunused-const-variable fires on plat.c, acpi.c and hwmon.c.
>
> Document the client platforms in Documentation/arch/x86/amd_hsmp.rst,
> which until now described HSMP as available only on the EPYC server
> parts and MI300A. The character device and ioctl interface are unchanged
> there; what differs is the accepted message IDs, so the text points at
> the HSMP_CLIENT_* set in the UAPI header.

Hi,

i am asking myself if there exist a connection between the Ryzen Master SM=
C
message ids and the AMD_ACPI WMI device:

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Clas=
s to Query/Set a CLKValue"), guid("{95F20B61-3D44-41F8-87E1-03CBF94C4E8F}"=
)]
class AMD_ACPI {
   [key, read] string InstanceName;
   [read] boolean Active;

   [WmiMethodId(1), Implemented, read, write, Description("Get version")] =
void QueryVersion([out, Description("version")] uint32 version);
   [WmiMethodId(2), Implemented, read, write, Description("WMI function in=
it.")] void Init([out, Description("status")] uint8 status);
   [WmiMethodId(3), Implemented, read, write, Description("Get BIOS ACPI s=
upport function table.")] void GetObjectID([out, Description("Get BIOS sup=
port Object ID table")] OIDPackage pack);
   [WmiMethodId(4), Implemented, read, write, Description("Bios request da=
ta")] void Getdvalues([in, Description("ID used to identify")] uint32 ID, =
[out, Description("status")] GetdValuesPackage pack);
   [WmiMethodId(5), Implemented, read, write, Description("Command Run")] =
void RunCommand([in, Description("In buffer")] uint8 Inbuf[8], [out, Descr=
iption("Out buffer")] OutBuffer Outbuf);
   [WmiMethodId(6), Implemented, read, write, Description("Get Min/Max/Ste=
pping values")] void GetMinMaxSteppingValues([in, Description("ID used to =
identify")] uint32 ID, [out, Description("status")] GetMinMaxSteppingPacka=
ge pack);
   [WmiMethodId(7), Implemented, read, write, Description("Get DIMM SPD da=
ta")] void GetDimmSpdData([in, Description("DIMM Index")] uint32 Index, [o=
ut, Description("SPD Data Buffer")] DimmSpdBuffer DimmSpdData);
   [WmiMethodId(8), Implemented, read, write, Description("Get BIOS ACPI s=
upport function table2.")] void GetObjectID2([out, Description("Get BIOS s=
upport Object ID table2")] OIDPackage pack);
   [WmiMethodId(9), Implemented, read, write, Description("Get RMP table")=
] void GetRmpData([out, Description("Get RMP table")] RMPPackage pack);
   [WmiMethodId(10), Implemented, read, write, Description("Get OPP Heaer"=
)] void GetOppTable([out, Description("Get Opp Heaer")] OPPHeader pack);
   [WmiMethodId(11), Implemented, read, write, Description("Get OPP Data")=
] void GetOppData([in, Description("Profile Index")] uint32 Index, [out, D=
escription("Opp Profile")] OPPProfole pack);
};

I own multiple devices with such an interface, and i would _love_ to add s=
upport
for them.

Thanks,
Armin Wolf

> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>   Documentation/arch/x86/amd_hsmp.rst  |  18 +++-
>   arch/x86/include/uapi/asm/amd_hsmp.h | 137 +++++++++++++++++++++++++++
>   drivers/platform/x86/amd/hsmp/hsmp.c | 125 ++++++++++++++++++++----
>   drivers/platform/x86/amd/hsmp/hsmp.h |  73 ++++++++++++++
>   drivers/platform/x86/amd/hsmp/plat.c |  39 ++++----
>   5 files changed, 354 insertions(+), 38 deletions(-)
>
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x8=
6/amd_hsmp.rst
> index fa1fc240e212..8a9d6fe7d4cf 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -8,6 +8,21 @@ Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 0xa=
0-0xaf),
>   Fam1Ah(model 0x00-0x1f) EPYC server line of processors from AMD suppor=
t
>   system management functionality via HSMP (Host System Management Port)=
.
>  =20
> +The Fam1Ah client platforms are supported as well:
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +  Model          Platform
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +  0x80-0x87      Medusa1
> +  0x88-0x8f      Olympic Ridge
> +  0xe0-0xe3      Medusa2
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> +
> +They share one mailbox and speak the Ryzen Master SMC message set inste=
ad
> +of the server HSMP message set, so the message IDs accepted on them are
> +the HSMP_CLIENT_* ones listed in arch/x86/include/uapi/asm/amd_hsmp.h.
> +The character device and ioctl interface described below are the same.
> +
>   The Host System Management Port (HSMP) is an interface to provide
>   OS-level software with access to system management functions via a
>   set of mailbox registers.
> @@ -17,7 +32,8 @@ More details on the interface can be found in chapter
>   Eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
>  =20
>  =20
> -HSMP interface is supported on EPYC line of server CPUs and MI300A (APU=
).
> +HSMP interface is supported on EPYC line of server CPUs, MI300A (APU) a=
nd
> +the Fam1Ah client platforms listed above.
>  =20
>  =20
>   HSMP device
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uap=
i/asm/amd_hsmp.h
> index eda336bfd3e9..b4c3ddb9d1c1 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -664,4 +664,141 @@ struct hsmp_telemetry_data {
>   #define HSMP_IOCTL_GET_TELEMETRY_DATA \
>   	_IOW(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
>  =20
> +/*
> + * Client HSMP messages supported on the Family 1Ah client platforms:
> + * Models 80h-87h (Medusa1), Models 88h-8Fh (Olympic Ridge) and
> + * Models E0h-E3h (Medusa2).
> + * These map to Ryzen Master SMC (RMSMC) message IDs.
> + */
> +enum hsmp_client_message_ids {
> +	HSMP_CLIENT_TEST =3D 1,			/* 01h Test message */
> +	HSMP_CLIENT_GET_SMU_VER,		/* 02h SMU FW version */
> +	HSMP_CLIENT_GET_INTERFACE_VER,		/* 03h Interface version */
> +	HSMP_CLIENT_GET_METRICS_TABLE_VER,	/* 04h Metrics table version */
> +	HSMP_CLIENT_GET_METRICS_TABLE,		/* 05h Metrics table log sample */
> +	HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,/* 06h Metrics table DRAM addr=
ess */
> +	HSMP_CLIENT_SET_CORE_PSM_MARGIN,	/* 07h Set core PSM margin */
> +	HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN,	/* 08h Set all core PSM margin */
> +	HSMP_CLIENT_SET_FAST_PPT_LIMIT,		/* 09h Set fast PPT limit */
> +	HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT,	/* 0Ah Set VRM VDD current limi=
t */
> +	HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT,/* 0Bh Set VRM VDD max curre=
nt limit */
> +	HSMP_CLIENT_SET_TJ_MAX,			/* 0Ch Set TjMax */
> +	HSMP_CLIENT_SET_FIT_LIMIT_SCALAR,	/* 0Dh Set FIT limit scalar */
> +	HSMP_CLIENT_ENABLE_OVERCLOCKING,	/* 0Eh Enable overclocking */
> +	HSMP_CLIENT_DISABLE_OVERCLOCKING,	/* 0Fh Disable overclocking */
> +	HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES,/* 10h Set OC freq all cores =
*/
> +	HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE,/* 11h Set OC freq per core */
> +	HSMP_CLIENT_SET_OVERCLOCK_VID,		/* 12h Set OC VID */
> +	HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY,/* 13h Set FCLK OC on-the-fl=
y */
> +	HSMP_CLIENT_GET_CORE_PERF_ORDER,	/* 14h Get core performance order */
> +	HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT,	/* 15h Set sustained power limi=
t */
> +	HSMP_CLIENT_SET_SLOW_PPT_LIMIT,		/* 16h Set slow PPT limit */
> +	HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT,/* 17h Set VRM GFX max curre=
nt limit */
> +	HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT,	/* 18h Set VRM SOC current limi=
t */
> +	HSMP_CLIENT_SET_FAST_SPM_LIMIT,		/* 19h Set fast SPM limit */
> +	HSMP_CLIENT_SET_SLOW_SPM_LIMIT,		/* 1Ah Set slow SPM limit */
> +	HSMP_CLIENT_GET_CORE_PSM_MARGIN,	/* 1Bh Get core PSM margin */
> +	HSMP_CLIENT_GET_GFX_PSM_MARGIN,		/* 1Ch Get GFX PSM margin */
> +	HSMP_CLIENT_SPARE_0X1D,			/* 1Dh Spare */
> +	HSMP_CLIENT_SPARE_0X1E,			/* 1Eh Spare */
> +	HSMP_CLIENT_SPARE_0X1F,			/* 1Fh Spare */
> +	HSMP_CLIENT_SPARE_0X20,			/* 20h Spare */
> +	HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID,/* 21h Set GfxClk overdri=
ve by freq/VID */
> +	HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE,	/* 22h Disable GfxClk overdrive =
*/
> +	HSMP_CLIENT_SET_GFX_PSM_MARGIN,		/* 23h Set GFX PSM margin */
> +	HSMP_CLIENT_SET_CCLK_FMAX_OFFSET,	/* 24h Set CCLK Fmax offset */
> +	HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET,/* 25h Set core power limit of=
fset */
> +	HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND,	/* 26h Add extra PSM guardband */
> +	HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX,/* 27h Add extra PSM guardband=
 GFX */
> +	HSMP_CLIENT_SET_GFXCLK_FMAX,		/* 28h Set GfxClk Fmax */
> +	HSMP_CLIENT_MSG_ID_MAX,
> +};
> +
> +/* Client message descriptor table (Family 1Ah Models 80h-8Fh, E0h-E3h)=
 */
> +static const struct hsmp_msg_desc hsmp_client_msg_desc_table[]
> +				__attribute__((unused)) =3D {
> +	/* RESERVED */
> +	{0, 0, HSMP_RSVD},
> +	/* HSMP_CLIENT_TEST */
> +	{1, 1, HSMP_GET},
> +	/* HSMP_CLIENT_GET_SMU_VER */
> +	{0, 1, HSMP_GET},
> +	/* HSMP_CLIENT_GET_INTERFACE_VER */
> +	{0, 1, HSMP_GET},
> +	/* HSMP_CLIENT_GET_METRICS_TABLE_VER */
> +	{0, 1, HSMP_GET},
> +	/* HSMP_CLIENT_GET_METRICS_TABLE */
> +	{0, 0, HSMP_GET},
> +	/* HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR */
> +	{0, 3, HSMP_GET},
> +	/* HSMP_CLIENT_SET_CORE_PSM_MARGIN */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_ALL_CORE_PSM_MARGIN */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_FAST_PPT_LIMIT */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_VRM_VDD_CURRENT_LIMIT */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_VRM_VDD_MAX_CURRENT_LIMIT */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_TJ_MAX */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_FIT_LIMIT_SCALAR */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_ENABLE_OVERCLOCKING */
> +	{0, 0, HSMP_SET},
> +	/* HSMP_CLIENT_DISABLE_OVERCLOCKING */
> +	{0, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_OVERCLOCK_FREQ_ALL_CORES */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_OVERCLOCK_FREQ_PER_CORE */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_OVERCLOCK_VID */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_FCLK_OVERCLOCK_ON_THE_FLY */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_GET_CORE_PERF_ORDER */
> +	{1, 1, HSMP_GET},
> +	/* HSMP_CLIENT_SET_SUSTAINED_POWER_LIMIT */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_SLOW_PPT_LIMIT */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_VRM_GFX_MAX_CURRENT_LIMIT */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_VRM_SOC_CURRENT_LIMIT */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_FAST_SPM_LIMIT */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_SLOW_SPM_LIMIT */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_GET_CORE_PSM_MARGIN */
> +	{1, 1, HSMP_GET},
> +	/* HSMP_CLIENT_GET_GFX_PSM_MARGIN */
> +	{0, 1, HSMP_GET},
> +	/* HSMP_CLIENT_SPARE_0X1D */
> +	{0, 0, HSMP_RSVD},
> +	/* HSMP_CLIENT_SPARE_0X1E */
> +	{0, 0, HSMP_RSVD},
> +	/* HSMP_CLIENT_SPARE_0X1F */
> +	{0, 0, HSMP_RSVD},
> +	/* HSMP_CLIENT_SPARE_0X20 */
> +	{0, 0, HSMP_RSVD},
> +	/* HSMP_CLIENT_SET_GFXCLK_OVERDRIVE_BY_FREQ_VID */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_DISABLE_GFXCLK_OVERDRIVE */
> +	{0, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_GFX_PSM_MARGIN */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_CCLK_FMAX_OFFSET */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_CORE_POWER_LIMIT_OFFSET */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_ADD_EXTRA_PSM_GUARDBAND_GFX */
> +	{1, 0, HSMP_SET},
> +	/* HSMP_CLIENT_SET_GFXCLK_FMAX */
> +	{1, 0, HSMP_SET},
> +};
> +
>   #endif /*_ASM_X86_AMD_HSMP_H_*/
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86=
/amd/hsmp/hsmp.c
> index 5e123a4ecea9..9b65dbd47965 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -45,7 +45,67 @@
>    */
>   #define CHECK_GET_BIT		BIT(31)
>  =20
> -static struct hsmp_plat_device hsmp_pdev;
> +static const struct hsmp_mbaddr_info hsmp_mbinfo_server =3D {
> +	.base_addr	=3D SMN_HSMP_BASE,
> +	.msg_id_off	=3D SMN_HSMP_MSG_ID,
> +	.msg_resp_off	=3D SMN_HSMP_MSG_RESP,
> +	.msg_arg_off	=3D SMN_HSMP_MSG_DATA,
> +};
> +
> +/* RM: Ryzen Master, the SMC interface these client addresses belong to=
 */
> +static const struct hsmp_mbaddr_info hsmp_mbinfo_client =3D {
> +	.base_addr	=3D SMN_HSMP_BASE_RM,
> +	.msg_id_off	=3D SMN_HSMP_MSG_ID_RM,
> +	.msg_resp_off	=3D SMN_HSMP_MSG_RESP_RM,
> +	.msg_arg_off	=3D SMN_HSMP_MSG_DATA_RM,
> +};
> +
> +/*
> + * The descriptors carry only the message IDs the driver issues itself,=
 which
> + * are also the only ones the two message sets have in common.  Message=
s named
> + * by userspace in an ioctl need no entry here, as that path already re=
solves
> + * the ID against the running platform's table.
> + */
> +static const struct hsmp_plat_desc hsmp_desc_server =3D {
> +	.mbinfo			=3D &hsmp_mbinfo_server,
> +	.msg_desc		=3D hsmp_msg_desc_table,
> +	.num_msgs		=3D HSMP_MSG_ID_MAX,
> +	.test_msg		=3D HSMP_TEST,
> +	.proto_ver_msg		=3D HSMP_GET_PROTO_VER,
> +};
> +
> +/* The client drives a different mailbox with the Ryzen Master SMC mess=
age set */
> +static const struct hsmp_plat_desc hsmp_desc_client =3D {
> +	.mbinfo			=3D &hsmp_mbinfo_client,
> +	.msg_desc		=3D hsmp_client_msg_desc_table,
> +	.num_msgs		=3D HSMP_CLIENT_MSG_ID_MAX,
> +	.test_msg		=3D HSMP_CLIENT_TEST,
> +	.proto_ver_msg		=3D HSMP_CLIENT_GET_INTERFACE_VER,
> +};
> +
> +static struct hsmp_plat_device hsmp_pdev =3D {
> +	/*
> +	 * Overridden for the client in get_hsmp_pdev(), which every driver
> +	 * calls before it touches a socket.  Defaulting it here rather than
> +	 * leaving it NULL keeps the message plumbing safe for any caller that
> +	 * arrives without going through there.
> +	 */
> +	.desc =3D &hsmp_desc_server,
> +};
> +
> +/*
> + * Callers must bounds-check msg_id against desc->num_msgs first; this =
returns
> + * NULL rather than indexing out of range if they did not.
> + */
> +static inline const struct hsmp_msg_desc *get_msg_desc(u32 msg_id)
> +{
> +	const struct hsmp_plat_desc *desc =3D hsmp_pdev.desc;
> +
> +	if (msg_id >=3D desc->num_msgs)
> +		return NULL;
> +
> +	return &desc->msg_desc[msg_id];
> +}
>  =20
>   /*
>    * Gates the AMD HSMP data plane against socket bring-up and teardown.
> @@ -184,30 +244,37 @@ static int __hsmp_send_message(struct hsmp_socket =
*sock, struct hsmp_message *ms
>  =20
>   static int validate_message(struct hsmp_message *msg)
>   {
> +	const struct hsmp_msg_desc *desc;
> +
>   	/* msg_id against valid range of message IDs */
> -	if (msg->msg_id < HSMP_TEST || msg->msg_id >=3D HSMP_MSG_ID_MAX)
> +	if (msg->msg_id < hsmp_pdev.desc->test_msg ||
> +	    msg->msg_id >=3D hsmp_pdev.desc->num_msgs)
> +		return -ENOMSG;
> +
> +	desc =3D get_msg_desc(msg->msg_id);
> +	if (!desc)
>   		return -ENOMSG;
>  =20
>   	/* msg_id is a reserved message ID */
> -	if (hsmp_msg_desc_table[msg->msg_id].type =3D=3D HSMP_RSVD)
> +	if (desc->type =3D=3D HSMP_RSVD)
>   		return -ENOMSG;
>  =20
>   	/*
>   	 * num_args passed by user should match the num_args specified in
>   	 * message description table.
>   	 */
> -	if (msg->num_args !=3D hsmp_msg_desc_table[msg->msg_id].num_args)
> +	if (msg->num_args !=3D desc->num_args)
>   		return -EINVAL;
>  =20
>   	/*
>   	 * As the HSMP protocol evolves, newer platforms may define more
>   	 * response arguments for existing messages.  Use an upper-bound
>   	 * check so that older userspace callers requesting fewer response
> -	 * words than what the current hsmp_msg_desc_table[] defines are
> -	 * still accepted, while rejecting requests that exceed the
> -	 * hardware capability.
> +	 * words than what the current descriptor table defines are still
> +	 * accepted, while rejecting requests that exceed the hardware
> +	 * capability.
>   	 */
> -	if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
> +	if (msg->response_sz > desc->response_sz)
>   		return -EINVAL;
>  =20
>   	return 0;
> @@ -316,7 +383,7 @@ int hsmp_test(u16 sock_ind, u32 value)
>   	 * Test the hsmp port by performing TEST command. The test message
>   	 * takes one argument and returns the value of that argument + 1.
>   	 */
> -	msg.msg_id	=3D HSMP_TEST;
> +	msg.msg_id	=3D hsmp_pdev.desc->test_msg;
>   	msg.num_args	=3D 1;
>   	msg.response_sz	=3D 1;
>   	msg.args[0]	=3D value;
> @@ -340,10 +407,15 @@ EXPORT_SYMBOL_NS_GPL(hsmp_test, "AMD_HSMP");
>  =20
>   static bool is_get_msg(struct hsmp_message *msg)
>   {
> -	if (hsmp_msg_desc_table[msg->msg_id].type =3D=3D HSMP_GET)
> +	const struct hsmp_msg_desc *desc =3D get_msg_desc(msg->msg_id);
> +
> +	if (!desc)
> +		return false;
> +
> +	if (desc->type =3D=3D HSMP_GET)
>   		return true;
>  =20
> -	if (hsmp_msg_desc_table[msg->msg_id].type =3D=3D HSMP_SET_GET &&
> +	if (desc->type =3D=3D HSMP_SET_GET &&
>   	    (msg->args[0] & CHECK_GET_BIT))
>   		return true;
>  =20
> @@ -354,6 +426,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned=
 long arg)
>   {
>   	int __user *arguser =3D (int  __user *)arg;
>   	struct hsmp_message msg =3D { 0 };
> +	const struct hsmp_msg_desc *desc;
>   	int ret;
>  =20
>   	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct h=
smp_message)))
> @@ -361,23 +434,28 @@ static long hsmp_ioctl_msg(struct file *fp, unsign=
ed long arg)
>  =20
>   	/*
>   	 * Check msg_id is within the range of supported msg ids
> -	 * i.e within the array bounds of hsmp_msg_desc_table
> +	 * i.e within the array bounds of the platform's descriptor table
>   	 */
> -	if (msg.msg_id < HSMP_TEST || msg.msg_id >=3D HSMP_MSG_ID_MAX)
> +	if (msg.msg_id < hsmp_pdev.desc->test_msg ||
> +	    msg.msg_id >=3D hsmp_pdev.desc->num_msgs)
>   		return -ENOMSG;
>  =20
>   	/*
>   	 * Sanitize the user-controlled msg_id against speculative
>   	 * execution.  The bounds check above retires the out-of-range
>   	 * case with -ENOMSG, but a mispredicted branch can still let the
> -	 * CPU speculatively use msg_id as an index into
> -	 * hsmp_msg_desc_table[] (here and in validate_message() /
> +	 * CPU speculatively use msg_id as an index into the message
> +	 * descriptor tables (here and in validate_message() /
>   	 * is_get_msg() called downstream via hsmp_send_message()), and
>   	 * pull arbitrary kernel memory into the cache (Spectre v1,
>   	 * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
>   	 * dereference sees the sanitized value.
>   	 */
> -	msg.msg_id =3D array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
> +	msg.msg_id =3D array_index_nospec(msg.msg_id, hsmp_pdev.desc->num_msgs=
);
> +
> +	desc =3D get_msg_desc(msg.msg_id);
> +	if (!desc || desc->type =3D=3D HSMP_RSVD)
> +		return -ENOMSG;
>  =20
>   	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
>   	case FMODE_WRITE:
> @@ -410,7 +488,7 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned=
 long arg)
>   	if (ret)
>   		return ret;
>  =20
> -	if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
> +	if (desc->response_sz > 0) {
>   		/* Copy results back to user for get/monitor commands */
>   		if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
>   			return -EFAULT;
> @@ -687,9 +765,9 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>   	struct hsmp_message msg =3D { 0 };
>   	int ret;
>  =20
> -	msg.msg_id	=3D HSMP_GET_PROTO_VER;
> +	msg.msg_id	=3D hsmp_pdev.desc->proto_ver_msg;
>   	msg.sock_ind	=3D sock_ind;
> -	msg.response_sz =3D hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_s=
z;
> +	msg.response_sz	=3D get_msg_desc(msg.msg_id)->response_sz;
>  =20
>   	ret =3D hsmp_send_message_locked(&msg);
>   	if (!ret)
> @@ -735,6 +813,15 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, "AMD_HSM=
P");
>  =20
>   struct hsmp_plat_device *get_hsmp_pdev(void)
>   {
> +	/*
> +	 * Both drivers call this before they bring any socket up, and the CPU
> +	 * this selects on is fixed long before either can load, so resolving
> +	 * the platform description here is enough to have it in place for
> +	 * every mailbox access and for the probe paths themselves.
> +	 */
> +	if (is_client_platform())
> +		hsmp_pdev.desc =3D &hsmp_desc_client;
> +
>   	return &hsmp_pdev;
>   }
>   EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86=
/amd/hsmp/hsmp.h
> index 8dbff16a87b1..b4bd9800dee1 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -10,6 +10,8 @@
>   #ifndef HSMP_H
>   #define HSMP_H
>  =20
> +#include <asm/amd/hsmp.h>
> +
>   #include <linux/compiler_types.h>
>   #include <linux/device.h>
>   #include <linux/hwmon.h>
> @@ -17,6 +19,7 @@
>   #include <linux/miscdevice.h>
>   #include <linux/mutex.h>
>   #include <linux/pci.h>
> +#include <linux/processor.h>
>   #include <linux/rwsem.h>
>   #include <linux/semaphore.h>
>   #include <linux/sysfs.h>
> @@ -32,6 +35,51 @@
>  =20
>   #define DRIVER_VERSION		"2.6"
>  =20
> +/*
> + * To access a specific HSMP mailbox register, s/w writes the SMN addre=
ss of the
> + * HSMP mailbox register into the SMN_INDEX register, and reads/writes =
the
> + * SMN_DATA reg.  Below are the SMN addresses of the HSMP mailbox regis=
ters in
> + * SMU address space, as consumed by the fixed mailbox descriptors in h=
smp.c.
> + *
> + * The server set is used by the non-ACPI path only; the ACPI path disc=
overs the
> + * equivalent values from _CRS/_DSD.  The _RM set is the client one, na=
med for
> + * the Ryzen Master SMC (RMSMC) interface whose mailbox it addresses, a=
nd is
> + * used by both paths because the client exposes no _CRS/_DSD to discov=
er them
> + * from.  The two sets share a base and differ only in the register off=
sets
> + * behind it, but are kept separate so each stays tied to the platform =
it was
> + * documented for.
> + */
> +#define SMN_HSMP_BASE		0x03B00000
> +#define SMN_HSMP_MSG_ID		0x00010534
> +#define SMN_HSMP_MSG_ID_F1A_M0H	0x00010934
> +#define SMN_HSMP_MSG_RESP	0x00010980
> +#define SMN_HSMP_MSG_DATA	0x000109E0
> +
> +/* _RM: Ryzen Master SMC, the client mailbox */
> +#define SMN_HSMP_BASE_RM	0x03B00000
> +#define SMN_HSMP_MSG_ID_RM	0x00010A8C
> +#define SMN_HSMP_MSG_RESP_RM	0x00010A90
> +#define SMN_HSMP_MSG_DATA_RM	0x00010A94
> +
> +/*
> + * Family 1Ah client platforms use the Ryzen Master SMC (client) mailbo=
x and
> + * message set instead of the server HSMP interface:
> + *
> + *	Models 80h-87h	Medusa1
> + *	Models 88h-8Fh	Olympic Ridge
> + *	Models E0h-E3h	Medusa2
> + *
> + * They all share the SMN_HSMP_*_RM mailbox addresses above and the sam=
e
> + * message set, so one predicate covers them and the two adjacent Model=
 8xh
> + * ranges are tested as one.
> + */
> +static inline bool is_client_platform(void)
> +{
> +	return boot_cpu_data.x86 =3D=3D 0x1A &&
> +	       ((boot_cpu_data.x86_model >=3D 0x80 && boot_cpu_data.x86_model =
<=3D 0x8F) ||
> +		(boot_cpu_data.x86_model >=3D 0xE0 && boot_cpu_data.x86_model <=3D 0x=
E3));
> +}
> +
>   struct hsmp_mbaddr_info {
>   	u32 base_addr;
>   	u32 msg_id_off;
> @@ -40,6 +88,30 @@ struct hsmp_mbaddr_info {
>   	u32 size;
>   };
>  =20
> +/*
> + * Per-platform description of the mailbox and the message set behind i=
t.
> + * Resolved once from the running CPU and reached through hsmp_pdev->de=
sc, so
> + * neither the message plumbing nor the probe paths have to re-derive w=
hich
> + * platform they are on.
> + *
> + * @mbinfo:		fixed SMN mailbox addresses.  The ACPI path uses these
> + *			only where firmware exposes no _CRS/_DSD to read them
> + *			from, i.e. on the client.
> + * @msg_desc:		message descriptor table, indexed by message ID.
> + * @num_msgs:		number of entries in @msg_desc, and so the exclusive
> + *			upper bound on a valid message ID.
> + * @test_msg:		no-op message used to probe the mailbox.  Also the
> + *			lowest valid message ID, as ID 0 is reserved.
> + * @proto_ver_msg:	returns the interface version.
> + */
> +struct hsmp_plat_desc {
> +	const struct hsmp_mbaddr_info	*mbinfo;
> +	const struct hsmp_msg_desc	*msg_desc;
> +	u32				num_msgs;
> +	u32				test_msg;
> +	u32				proto_ver_msg;
> +};
> +
>   struct hsmp_socket {
>   	struct bin_attribute hsmp_attr;
>   	struct hsmp_mbaddr_info mbinfo;
> @@ -59,6 +131,7 @@ struct hsmp_socket {
>   struct hsmp_plat_device {
>   	struct miscdevice mdev;
>   	struct hsmp_socket *sock;
> +	const struct hsmp_plat_desc *desc;
>   	u32 proto_ver;
>   	u16 num_sockets;
>   };
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86=
/amd/hsmp/plat.c
> index e9b2b809c0f5..7423c98a7b3e 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -29,17 +29,6 @@
>  =20
>   #define DRIVER_NAME		"amd_hsmp"
>  =20
> -/*
> - * To access specific HSMP mailbox register, s/w writes the SMN address=
 of HSMP mailbox
> - * register into the SMN_INDEX register, and reads/writes the SMN_DATA =
reg.
> - * Below are required SMN address for HSMP Mailbox register offsets in =
SMU address space
> - */
> -#define SMN_HSMP_BASE		0x3B00000
> -#define SMN_HSMP_MSG_ID		0x0010534
> -#define SMN_HSMP_MSG_ID_F1A_M0H	0x0010934
> -#define SMN_HSMP_MSG_RESP	0x0010980
> -#define SMN_HSMP_MSG_DATA	0x00109E0
> -
>   static struct hsmp_plat_device *hsmp_pdev;
>  =20
>   static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> @@ -157,20 +146,18 @@ static int init_platform_device(struct device *dev=
)
>   		sock =3D &hsmp_pdev->sock[i];
>   		sock->sock_ind			=3D i;
>   		sock->dev			=3D dev;
> -		sock->mbinfo.base_addr		=3D SMN_HSMP_BASE;
>   		sock->amd_hsmp_rdwr		=3D amd_hsmp_pci_rdwr;
> +		sock->mbinfo			=3D *hsmp_pdev->desc->mbinfo;
>  =20
>   		/*
>   		 * This is a transitional change from non-ACPI to ACPI, only
>   		 * family 0x1A, model 0x00 platform is supported for both ACPI and n=
on-ACPI.
> +		 * It is the one part whose message-id register sits at a
> +		 * different offset on this path than the descriptor gives.
>   		 */
>   		if (is_f1a_m0h())
>   			sock->mbinfo.msg_id_off	=3D SMN_HSMP_MSG_ID_F1A_M0H;
> -		else
> -			sock->mbinfo.msg_id_off	=3D SMN_HSMP_MSG_ID;
>  =20
> -		sock->mbinfo.msg_resp_off	=3D SMN_HSMP_MSG_RESP;
> -		sock->mbinfo.msg_arg_off	=3D SMN_HSMP_MSG_DATA;
>   		sema_init(&sock->hsmp_sem, 1);
>  =20
>   		/* Test the hsmp interface on each socket */
> @@ -184,8 +171,18 @@ static int init_platform_device(struct device *dev)
>  =20
>   		ret =3D hsmp_cache_proto_ver(i);
>   		if (ret) {
> -			dev_err(dev, "Failed to read HSMP protocol version\n");
> -			return ret;
> +			/*
> +			 * Some client SMU builds reject the interface-version
> +			 * query with "invalid message" even though the mailbox
> +			 * is functional, as the test message above just
> +			 * showed.  Keep going there instead of failing the
> +			 * probe: proto_ver only gates server-side features.
> +			 */
> +			if (!is_client_platform()) {
> +				dev_err(dev, "Failed to read HSMP protocol version\n");
> +				return ret;
> +			}
> +			dev_warn(dev, "Interface version query unsupported on client SMU; co=
ntinuing\n");
>   		}
>  =20
>   		if (hsmp_pdev->proto_ver =3D=3D HSMP_PROTO_VER6) {
> @@ -317,6 +314,12 @@ static bool legacy_hsmp_support(void)
>   	case 0x1A:
>   		switch (boot_cpu_data.x86_model) {
>   		case 0x00 ... 0x0F:
> +		/*
> +		 * Client platforms: 80h-87h (Medusa1), 88h-8Fh (Olympic
> +		 * Ridge), E0h-E3h (Medusa2)
> +		 */
> +		case 0x80 ... 0x8F:
> +		case 0xE0 ... 0xE3:
>   			return true;
>   		default:
>   			return false;
