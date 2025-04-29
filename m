Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0587D2C179E
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 11:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927030; cv=none; b=ryxyc0z2e2zsrAKLnnft2e7tjZ4jPjFdBpe9eyclzbFAoYQemPNq1ncmleMJVKBTE1kynQ4GZRqxlA6JDJ8rkdfEJFqpy0XU7GSESnoaQhOSYVsLndN16mtq7D2vQXM9HGqknejKhLZRC/gRatKYJ9ZuxLYnHxf0nzk90tAHWZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927030; c=relaxed/simple;
	bh=es0vT3kbLlWW0itL8MY3yq6eu9GKZ1xt/usvKZDNeuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsMzk8/7hvOWBSY94gaGhJr6YDELFJyMpjQeG+HU+vkxXm+VRI1u8za8iMwy4rio5s1WCIO3OuHUnnjPSar7hQzERUR1aLe8+dqHPNyzaRntqbx2G6opP8rka2UTu/IPOgWbfuA2Mhv1jX5QfTsEbUy4hpUoSg8I7kBdK8CWVI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=B1a3ZpRH; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="B1a3ZpRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1745927019; x=1746531819; i=w_armin@gmx.de;
	bh=qvdoQE3Z2mzZ5y/jSgcSdrFitgf7/YdfXH66t4XGGWU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=B1a3ZpRHFL9g1YfyzQynA8SGAYuWVIevmz9wp3PyXvJAEK1RGLy8oTPhRdp9iF7z
	 l2J8ury5xRtgHxfutWOdWvcICYVkc3y5QMum4HqRTrqER+VC5r6T8eczOAomkvzwu
	 3oIxvkv7HkqqfhWY1niy+ucJevPFT1zU/+f8iR5pQURGCMhTk38priM3Xg9nqH59e
	 6r04JfTr4qF1joHKzMbSpt/+NMW3QAgkFYurxSqJhKW5TOJWnUSJxn9R+G31GgABX
	 xy0KnTjRCEU9yzDEr1DIHiNfH567KFfFhUIXaRxdOEaDZMehkic2ejhy6clSumqNa
	 mR0VugTOeffAwWl+mw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbIn-1uJJkG0BrX-00B6Ei; Tue, 29
 Apr 2025 13:43:39 +0200
Message-ID: <ad09634e-e6a4-48af-9e02-345ffa866474@gmx.de>
Date: Tue, 29 Apr 2025 13:43:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: thinkpad_acpi: Unhandled HKEY event when toggling GNOME charging
 states
To: debarbos@redhat.com, hmh@hmh.eng.br
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.org
References: <aBA4PyT3YdKaPFdn@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <aBA4PyT3YdKaPFdn@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mfToSZfYxs2qPc3o9ynWYzwZQgl6JRo6BtM0qHXG2Ml76LbEy9l
 jfrBaxY0tNmaxF/V1XIH/UIHERHXl74HSRs1mfloAOp0bvxediCKc1MElgpsVEj3ZfuScFR
 H5Ticlwn0Yv106849MEnLIOsJXW8S5nwkrJDYbHP9BWDLIZ60sJ43y6nHIquhkI3lBJaef1
 Pkzc6IKJYqKe+KXE6t26A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lhT5/BHu/fE=;ni2wq3DgGBRooWOzLGspvpaVfTr
 nNd4Wj0pAFthx3HTWLPHQQ12mfNWD+tw/y3lqJKWco5EBtiolDVox5brQaEpQ67OGOLeEKiae
 E5GkXHlvOuWma35JEKFigWbM9QMrS/ne62RTDg5inA8hAt/wEYm7HO7RRyH0r9iPLIxKiBy3C
 hLUh3KeY4XZZ5OWgNDYDPfFZQ7AhE9dU8n2s/OJnLUFmQw4JNozW5UdJyJyjZ0vsQQYlvqUZH
 svXiVSeA9gk2elO5m4a+mEYeFb3aPcVUIxc1AigMkrssqSdp5LqqurUTlRyey51n6j9ZqrBAf
 b1eUvbb75PotMLdZctbJuQy6EnK2j+KFP5ynb11a0k0dAJPsQcy6BTzL82gL7VwAvQyHJkZ7S
 QQAAEMAt7ycqj5aIMxG66p7DMjo5bpcAmKUXuYga7t++HAMjAsa5v573ZCrASasP3L5Wzx2mF
 IGioMSHVpo5clNLRZ96imoetukm08uqVLVHUJUFFDBDuv8mIni910wR8Oe+6vphVQPrkTaB4e
 n/Np7cufHqz2TrYCDHRzEtBFkzUnzbsQObqomEyX2o9IpV4rjOk14WWwuB4PaJXUuQS9ZDh0C
 lMvQATAWtdZpMrwxIf9O0VdYgdS22WNuggeTTQqbnGTIndVuRTW3IMRPTa65VID0PHqTo6tYY
 apTLy3QOjFFWfUXBUSHkqzQYfKd7ZrOik0+kR3q3CDg0rXMWGKJPwpSBYA34uJ/gx15b27IIb
 tIW7VvfnYJiaB9bfxfsuxy7ibxvUKmVYAap2QxhVSdcV+0r6piPN1TA2msv0fSSYTBbvu1tUS
 N5lfjaEeoLVhPWT9dFQPMVPIjcxJOfH69TYnPWGzCSTZ2/XkupIVuto3tOrujE4r6FwQmq1/L
 GJmdc6TBKh5ZfUBdGlAXnjcQ2JRNMf222TfpuL9T36fZZ39jL4RAkLcCUgQnYUhgPmslPPhgp
 HDSBz75CdsFPCGgX2sp8Ixbt4+DTOIuhHYqNX6uhlMNaJctIku1TBF/yTDD7TRKB+rfe5TxrO
 Ctw0Jas4BVa1jM9u24u90qE/8nGrTv6+90NoRHpdIS6CoKZosEwCsUl5QklwjuJ+gSQ0RKBcp
 v8ZREmQy+f4BBW7i6wwYgTOMSL/Xv+y+/NZ3KadvWxYE98zr7gJi6P/Mv0Het4fTavmU7zf6R
 atoGSguceGHHz8vg8f5M71iptQqc7DGtd/E7ND1xg54IEC69pF45jEnAz3rEDoaq6TWmhuj+J
 b32lvaL0w27DxnmpjsfBC/oaUsFS0FlRlgrxyhHZC2uhrVUnnX3b5MQ4mrcmHbvoDZXGt8boD
 6Tqak1+9i8QC+XmRXfqx1zTTXFTIXKX6952neUokMv6zMeCFZe1x+kFEWoz3+AQY5atPwPtwv
 V+QSJxuEKj3qGM/HSshi/Jhm8x3h+7AXJEgbmO0V/xNa/26gNvNiV8sQfz+OQv4os/ouHXQV+
 HS02qoeGrfMNEaipzK17ZhmsK1xgilDS5L9Y6v2SsFeWItLCAChks9Kju0E0aoCT3uVKNc30x
 7WHxFWJ+BqnAm9HZjEXxzQ31KMJ0GnM7RV1WJxw6EOwy8OsrdZBG1Mc4VnF33finNYBsHLurt
 S+ptCckKaK3SIGiuMEl8YXGKfFUdYz+edEup0KAFUWX/qiORIkVJzTocXIGJchL0Guy5BKjvJ
 twURSAyHNJ+c2PwyxrQMQKT5oYhndMN1CZ6d4r6x8Ekm49PmFAH6NoXOcPTvQZO1otNb0wNkl
 53C6b6ns8Dx3wgoBycF/dnUmQO4rhiDI8KIX3KlUPqLmYfmTHjvZBn2nwFw04IjVBOUTxJ3Gw
 s2bdUHDeSvszIdyo/6KUwpTf8sxkL3bMa1NOrwJKVUPa5rmSUMhdHQYQoRF1Ze9cP2eRAxrrQ
 PRTcZl1VYJHKJBpeY1SoIIjY8RqTcAtssx4p4AWh1lk+8IG0SIhfksSo2Mx1AVcBSHLMBM/HK
 hJABsEMk7fnv3Q6jxXV4CU+c8t1zL5lhT8GrvnNiR/BKSC6OaRsW8tSAJcdJygxo1ubq7I1xZ
 +D0YFrrhX4PgWnTresVzBEinjwS8RxdxpD7XcLWaff2i4TGqAvOk4M7RP4Otyl1iJQssfH05w
 RX1lIavm1wX1bD+VUqPiKbp2puZzRVID0VRGvPKUfU7EUVeVZWTh9StHwirZxDUVpbQciw5V/
 YdHgFX/DthWRJ2dZcPVUdOYJ3xVzQSPjtLt1b4KXb7+B1xUj6gKbYufzN8Xa5mSt34edNWX0J
 enKGKzQ+nugXLyKY62OLLcMXo+QWBpT/8rrz3uF3U+WHjAsWftOPaaVFsC/ddSHN0rS7foHbp
 jUCqcjM+kgHQaN0vrR9twY2AuXzMNiuKsGI7YIXPx7qsMtakftnlC2yP3aHMYsh8bQbg+4vpT
 K85wSL88ujQv8HWjGGK9vShDRGudceIjj3a3kQWMzDqjweG4rMWmQjo9oShaBn3MPMK33a/Hb
 BUAM2F5EX+2C/Q+K1AmSDVRzyK9Ydqq78pY425TCZcp5XJQnPWPJQkC7z9gYCje7UJgpLjfsP
 HLO2LSdPcm4Iuz4De/qHgrDyAzsgJ3AiY2qpJwF3D3SD9L9LJAQnLkP1FL6z7vHwBPPkv+++c
 yvgUFB498jERUKL+NGjLxhChFK9kHpJ37SwmFM35i3wcw0fxoyOxBetmQQYM8CvYFAPOuTVgv
 6s9AlTxVM7ScYVvgeKfERHcmPuwSHWMV+xCJmfFFRNogut4uv2CGHblRfGYIeJ0PRpQEkxPpg
 Vd6PVPJbwjzbRxGAhbWt9u75B4ANV7XsyqWBtb79IxriE8ci9KMvMdbEfumpgWHQjDAjFfbMF
 jhy18R5YJ4PwRlcHcjdc6D4nA+ubgqb8OX7iAQOfRWlXEAdwmmJ/F9OiGeBKxMkSMMD97WX44
 GhQKFGcVRF5XO2JoRB6xb4H5o0QztGGyDjZXvpQhWQZdfZb2IR/shuZIG9wV36O9/bGMbtwdm
 mlS7RX9sw1YltfEvKkn7/k+y+2HOtzZba7yW/c0OdAJdNnm4NWf40cRWCh+Tp5cZei1Lr+8OC
 Q==

Am 29.04.25 um 04:23 schrieb Derek Barbosa:

> Hello,
>
> When toggling the "Battery Charging" options in Gnome 48 on a 6.14 kerne=
l the dmesg logs report the following:
>
> [  290.214972] thinkpad_acpi: unhandled HKEY event 0x6013
> [  290.214976] thinkpad_acpi: please report the conditions when this eve=
nt happened to ibm-acpi-devel@lists.sourceforge.net
> [  290.217964] thinkpad_acpi: unhandled HKEY event 0x6013
> [  290.217967] thinkpad_acpi: please report the conditions when this eve=
nt happened to ibm-acpi-devel@lists.sourceforge.net
> [  291.449026] thinkpad_acpi: unhandled HKEY event 0x6013
> [  291.449033] thinkpad_acpi: please report the conditions when this eve=
nt happened to ibm-acpi-devel@lists.sourceforge.net
> [  291.450991] thinkpad_acpi: unhandled HKEY event 0x6013
> [  291.450994] thinkpad_acpi: please report the conditions when this eve=
nt happened to ibm-acpi-devel@lists.sourceforge.net
>
> This currently happens on a Lenovo ThinkPad T14 Gen 5, with an Intel Cor=
e
> Ultra 7 165U =C3=97 14 CPU, Intel=C2=AE Graphics (MTL) on kernel-version=
 Linux
> 6.14.3-300.fc42.x86_64.
>
> Thanks,

Can you send us the output of "acpidump"?

Thanks,
Armin Wolf

