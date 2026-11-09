Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237302;
	b=Dn/QwlX/GRaMyxIG8eqYg5uPh8iBOU8NSK5MAlG4kXoOCexI/zh4lj+CPXSxpDJVtMnU
	 2u3rG1+8hPj4gtvhbcfvrV7QDm5Zx9AD3CqWzSWqeG4l/AkwJNOn46S+POC5NjkEmubfL
	 ZAu85SehdbRd5ytvBv2zpTpB1vVo6k1dbOvjVLyxqyq2dUpNZiXkNZDGVq6PLkyQ5qlN8
	 tRWyYQ7XY6TSsNYa1YhpG6UnNMM7E/w83rA62+nG4ShsM755s0H2x8PMFRfJVgGTNtIwI
	 TflJOQ622bt6+4rduDnd+Nr77c3vTMGr7LYXe5r8aZV/z8SC8iC0IPS06yVT/TokgSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237302;
	h=Received:DKIM-Signature:Content-Type:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:
	 In-Reply-To;
	bh=r3s6B+lr7DDGsEVLcxfwZIs+LqrgTCXcoBGn2S7+mTY=;
	b=P8ztxwvTjjjUnRLEpboCAPvzQ48GCx5Fdsw3aV2bm4yk2FGG0eq/PafZqQz8i9+jh5E0
	 L0KhO4JsmmLYeIeiWlRwK6hYClaZ57E01xVMn2wg4V93IWlEzN4QAhvMl+FUZ7hDhDM0V
	 hjnb+ReAkm86X7zyfL7B63eVg+gObGVRWshbM5FTseO09paT8devA981KmnDIFmhDYeJ6
	 bjJLeDPYXstJ54EhiBUHcU6E61NRAKLb1zk6V5SO2jIa+dOJkWBU3NIsKQZz4EQzyNUo3
	 ohaOZpWish9a4PQrS8+glHI9UYfrIgJ+NYPLmD2cAv9EnmtDU+hJS3SBVMtIAgIA8pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jql0wb5F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD5D606A321;
	Mon,  9 Nov 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jql0wb5F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0441F0089F;
	Mon,  9 Nov 2026 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794237301;
	bh=r3s6B+lr7DDGsEVLcxfwZIs+LqrgTCXcoBGn2S7+mTY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Jql0wb5FdQBgaubXklkMxxM2+hIuloAEBDDY5xV4MceP/23CLg3OxpwYk5kGCzO2Z
	 wVIgBIxTTlnMzbnySk6WVaPYlFQuSxkPqRiVhroWy1LRQ8OkyOUwBrz4PyRPQWapD8
	 3s3dnUyOzA1Ue42frHhWaKLF+lt19KNGo6eAl0b/0OgGkj9W4E/Vk6ojuUEDtLB2B6
	 x1SVsCs0ovAmv8OrcDZLHjusedWhQibvyRLGILfChjSe9kwnUw9DS76igz43n9RotX
	 dCqJ4QUtW9rw/53VcT+qGOClaE3w4KodRTE9Ok5aJwXRTVbtW5Y9ikW+OOO0Y3Sneh
	 UKXUgWR9prqgQ==
Content-Type: multipart/mixed; boundary="------------A7xi0RJFcpUI0V6Z0A5xWgA2"
Message-ID: <0c75e1b8-db5b-4512-9aa7-f0cb84606ce5@kernel.org>
Date: Mon, 9 Nov 2026 16:14:57 +0100
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
Subject: Re: [PATCH 2/3] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC
 support
From: Hans de Goede <hansg@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-2-f4a8edaac447@oss.qualcomm.com>
 <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>

This is a multi-part message in MIME format.
--------------A7xi0RJFcpUI0V6Z0A5xWgA2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Abel,

On 9-Nov-26 15:52, Hans de Goede wrote:

<snip>

> For easier review by you I've split the improvements into 4 patches (attached):

<snip>

> 4: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
> really just checks for the original (gen6) support vs gen7 support
> drop the bools and directly check which variant ec->variant points
> at instead.

I accidentally left some debug code in patch 4, attached is a new version.


<snip>

> So about these differences:
> 
> 1: For the spk / mic mute LEDs, on a hunch I tried using std LED controls
> with a LED idx/id of 15 for the spk mute LED and that also works.
> 
> I did not find either way (REG_AUD vs REG_LED) for the spk mute LED in
> the DSDT, instead the DSDT ends up sending an ACPI notify event, relying
> on some windows driver to handle this.
> 
> How did you find that REG_AUD still works, did you just try the gen 6
> method ?
> 
> 2: For the kbd backlight, again the DSDT ends up sending an ACPI notify event
> and does not access the EC itself at all.
> 
> How did you find that T14S_EC_REG_KBD_BL1 also works on gen 7?

One more remark about the kbd-backlight the new mode which reports itself
as brightness 3 is an auto mode with brightness 2, but it turns off
the backlight after not using the keyboard for a while (and back on again
on the next keypress).

Newer x86 Thinkpads also have this and a whole new userspace API has just
landed to support this. Here is a patch adding support for this auto
mode to the x86 thinkpad_acpi driver:

https://lore.kernel.org/platform-driver-x86/20261101100123.28749-1-kmatzkaczor244@gmail.com/

Regards,

Hans



--------------A7xi0RJFcpUI0V6Z0A5xWgA2
Content-Type: text/x-patch; charset=UTF-8;
 name="0004-fixup-platform-arm64-lenovo-thinkpad-t14s-add-Gen-7-.patch"
Content-Disposition: attachment;
 filename*0="0004-fixup-platform-arm64-lenovo-thinkpad-t14s-add-Gen-7-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAwZTc3YzM2ZWQyYzlhYmE0OTg3MjM0NjVmMDFmZjZiYjIxN2FiYWRhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxqb2hhbm5lcy5nb2VkZUBv
c3MucXVhbGNvbW0uY29tPgpEYXRlOiBNb24sIDkgTm92IDIwMjYgMTQ6Mjk6MzcgKzAxMDAK
U3ViamVjdDogW1BBVENIIDQvNF0gZml4dXAhIHBsYXRmb3JtOiBhcm02NDogbGVub3ZvLXRo
aW5rcGFkLXQxNHM6IGFkZCBHZW4gNwogRUMgc3VwcG9ydAoKRHJvcCB0aGUgeGZlcl9sb2Nr
IG11dGV4IGFuZCBpbnN0ZWFkIHVzZSBpMmNfbG9ja19idXMoKSBsaWtlCnRoZSBleGlzdGlu
ZyB0MTRzIGdlbjYgc3VwcG9ydCBkb2VzIGZvciBtdWx0aS1tc2cgdHJhbnNhY3Rpb25zLgoK
QWxzbyBkcm9wIHRoZSBmc2xlZXAoNTAwMCkgaW4gdDE0c19nZW43X2VjX2NtZF9yZWFkKCkg
dGhlIERTRFQgY29kZQpoYXMgbm8gZGVsYXkgYmV0d2VlbiB0aGUgdHJhbnNmZXJzIHNvIHRo
aXMgaXMgbm90IG5lY2Vzc2FyeS4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGpv
aGFubmVzLmdvZWRlQG9zcy5xdWFsY29tbS5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS9h
cm02NC9sZW5vdm8tdGhpbmtwYWQtdDE0cy5jIHwgMzAgKysrKysrKystLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMu
YyBiL2RyaXZlcnMvcGxhdGZvcm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMuYwppbmRl
eCBhMjRiZjk1MjY4ZGMuLjQ1YjVjZGU2OWUzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0
Zm9ybS9hcm02NC9sZW5vdm8tdGhpbmtwYWQtdDE0cy5jCisrKyBiL2RyaXZlcnMvcGxhdGZv
cm0vYXJtNjQvbGVub3ZvLXRoaW5rcGFkLXQxNHMuYwpAQCAtMTMyLDggKzEzMiw2IEBAIHN0
cnVjdCB0MTRzX2VjIHsKIAlzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7CiAJc3RydWN0IGRldmlj
ZSAqZGV2OwogCWNvbnN0IHN0cnVjdCB0MTRzX2VjX3ZhcmlhbnQgKnZhcmlhbnQ7Ci0JLyog
c2VyaWFsaXplcyB0aGUgbXVsdGktbWVzc2FnZSBHZW4gNyBFQyB0cmFuc2FjdGlvbnMgKi8K
LQlzdHJ1Y3QgbXV0ZXggeGZlcl9sb2NrOwogCWVudW0gbGVkX2JyaWdodG5lc3MgbWljX211
dGVfY2FjaGU7CiAJc3RydWN0IHQxNHNfZWNfbGVkX2NsYXNzZGV2IGxlZF9wd3JfYnRuOwog
CXN0cnVjdCB0MTRzX2VjX2xlZF9jbGFzc2RldiBsZWRfY2hyZ19vcmFuZ2U7CkBAIC0yNTAs
MjQgKzI0OCwyOCBAQCBzdGF0aWMgaW50IHQxNHNfZ2VuN19lY19jbWRfcmVhZChzdHJ1Y3Qg
dDE0c19lYyAqZWMsIHU4IGNtZCwgdTggYXJnLCB1OCAqdmFsKQogCXN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQgPSB0b19pMmNfY2xpZW50KGVjLT5kZXYpOwogCXU4IHJlcVsyXSA9IHsg
Y21kLCBhcmcgfTsKIAlzdHJ1Y3QgaTJjX21zZyBtc2dzWzJdID0gewotCQl7IC5hZGRyID0g
Y2xpZW50LT5hZGRyLCAuZmxhZ3MgPSAwLCAubGVuID0gMSwgLmJ1ZiA9ICZyZXFbMF0gfSwK
KwkJeyAuYWRkciA9IGNsaWVudC0+YWRkciwgLmZsYWdzID0gMCwgLmxlbiA9IDIsIC5idWYg
PSAmcmVxWzBdIH0sCiAJCXsgLmFkZHIgPSBjbGllbnQtPmFkZHIsIC5mbGFncyA9IEkyQ19N
X1JELCAubGVuID0gMSwgLmJ1ZiA9IHZhbCB9LAogCX07CiAJaW50IHJldDsKIAotCWd1YXJk
KG11dGV4KSgmZWMtPnhmZXJfbG9jayk7CisJaTJjX2xvY2tfYnVzKGNsaWVudC0+YWRhcHRl
ciwgSTJDX0xPQ0tfU0VHTUVOVCk7CiAKLQlyZXQgPSBpMmNfbWFzdGVyX3NlbmQoY2xpZW50
LCByZXEsIHNpemVvZihyZXEpKTsKKwkvKiBTZW5kIGNtZCArIGFyZyAqLworCXJldCA9IF9f
aTJjX3RyYW5zZmVyKGNsaWVudC0+YWRhcHRlciwgbXNncywgMSk7CiAJaWYgKHJldCA8IDAp
Ci0JCXJldHVybiByZXQ7CisJCWdvdG8gb3V0OwogCi0JZnNsZWVwKDUwMDApOwotCi0JcmV0
ID0gaTJjX3RyYW5zZmVyKGNsaWVudC0+YWRhcHRlciwgbXNncywgQVJSQVlfU0laRShtc2dz
KSk7CisJLyogUmVzZW5kIHRoZSBjbWQgYnl0ZSArIHJlYWQgdGhlIHZhbHVlICovCisJbXNn
c1swXS5sZW4gPSAxOworCXJldCA9IF9faTJjX3RyYW5zZmVyKGNsaWVudC0+YWRhcHRlciwg
bXNncywgMik7CiAJaWYgKHJldCA8IDApCi0JCXJldHVybiByZXQ7CisJCWdvdG8gb3V0Owog
Ci0JcmV0dXJuIHJldCA9PSBBUlJBWV9TSVpFKG1zZ3MpID8gMCA6IC1FSU87CisJcmV0ID0g
cmV0ID09IDIgPyAwIDogRUlPOworb3V0OgorCWkyY191bmxvY2tfYnVzKGNsaWVudC0+YWRh
cHRlciwgSTJDX0xPQ0tfU0VHTUVOVCk7CisJcmV0dXJuIHJldDsKIH0KIAogc3RhdGljIGlu
dCB0MTRzX2dlbjdfZWNfd3JpdGUodm9pZCAqY29udGV4dCwgdW5zaWduZWQgaW50IHJlZywK
QEAgLTI3OCw4ICsyODAsNiBAQCBzdGF0aWMgaW50IHQxNHNfZ2VuN19lY193cml0ZSh2b2lk
ICpjb250ZXh0LCB1bnNpZ25lZCBpbnQgcmVnLAogCXU4IGJ1ZlszXSA9IHsgVDE0U19HRU43
X0VDX0NNRF9XUiwgcmVnLCB2YWwgfTsKIAlpbnQgcmV0OwogCi0JZ3VhcmQobXV0ZXgpKCZl
Yy0+eGZlcl9sb2NrKTsKLQogCXJldCA9IGkyY19tYXN0ZXJfc2VuZChjbGllbnQsIGJ1Ziwg
c2l6ZW9mKGJ1ZikpOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwpAQCAtNzMyLDEw
ICs3MzIsNiBAQCBzdGF0aWMgaW50IHQxNHNfZWNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCkKIAlpZiAoIWVjLT52YXJpYW50KQogCQllYy0+dmFyaWFudCA9ICZ0MTRzX2Vj
X3ZhcmlhbnQ7CiAKLQlyZXQgPSBkZXZtX211dGV4X2luaXQoZGV2LCAmZWMtPnhmZXJfbG9j
ayk7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKLQogCWkyY19zZXRfY2xpZW50ZGF0YShj
bGllbnQsIGVjKTsKIAogCWVjLT5yZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0KGRldiwgZWMt
PnZhcmlhbnQtPnJlZ21hcF9idXMsCi0tIAoyLjU1LjAKCg==

--------------A7xi0RJFcpUI0V6Z0A5xWgA2--
