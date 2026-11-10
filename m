Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794297243;
	b=GsagUxjGog8BqnQ2m9LrUjqOGInPxKoJXYYTkKz6XdApUJ+BDD2kUtDs+tVV+F7VRMyy
	 ZsuV/Xo7bQeEvBCf4yU2SwioXGF3Vl84jYAcHDdv7K9MxizfzHIPTJWRweBB/myHl1dvj
	 nJWQUR7Vw0gNsHEv62np34ro26v4ZzDvx1ProdvBF2Swt96MPiCsTA0/5wRZdx55oh0oH
	 CeCMubYbHY06ikDGwssJA50aJ5vjrvYey97o3S9Btg/blSbCtZV7f072I9Db3KfG8DZDH
	 jJcW7mUd+4txjMYwnCSNhec2covrA1PYvFxtNvUSbokFuDlA1eUusSwtbZ3yTUnUtsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tRnQd2LIAHJZoonewpOl9i62ZvqjRvQNSGRPP0Ehga4=;
	b=cIDLEeNoHWpk2UZVd9I8rsYkktobzu7tMNg8VCe0BPQJMNT0YJ9lf+1R/vHfrm/m8Nj8
	 C64twN38xvfSyPy4G3SfHVkTwEH5tTg4EkGLd5PIKKZX+bl9zgGSvify7S7MqZ9P6tdpR
	 WGUUSwYjmHbPD8rs5O84kCE3D0tEQ48b3O4uW+zmvloMiVvHO2vVSJ66+qyoAixsJTFOe
	 f1tQi7gLE8RXRf59yBkNBi8MvbeEC9/htSL3CSzYdXLClm62vd28kdLG8m9HeqKX3iv2t
	 CN8kAaSCTnp5u66d2g8KduG47OUz+y/7gImRFK1LjiyuCBD2XkOMbXys3IMlQcblMxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KR/ttua9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A27606A32E
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 07:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A27606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KR/ttua9
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5eadef147ffso452989e0c.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 23:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794297242; cv=none;
        d=google.com; s=arc-20260327;
        b=RXXixnnIVlEwhb4ztn/PtQt3xqlNEiPwEueh1shRjGSCEjliGo+E9U74eJR6P6FqaG
         g2MeriF99hYiVpDQ7P1sRZx8oAVDbnDJ3UcA3t4SLp8awrh/XEOOSijm+XvEfCZ16ZnY
         /Xpv4ph7Yn0CdTg8zIGVXsNNYnSHhwvrgIviZNfk+KD+o6tJYC+x3vb5DU+S585c7FSn
         MoA6PK4wN5Pgj+Hw3R8AFHV+8qTKNA4Qff4JcrKhBgcb+9+6Re4EVk0DaAlGS15N8wwx
         4fsfOCg9RKupLh8NmA2sC5LH2nSvJF4BQYTrtCbE9ybfHRx0aCivN/CEYWVI7QwUh8Jh
         JdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tRnQd2LIAHJZoonewpOl9i62ZvqjRvQNSGRPP0Ehga4=;
        fh=1vBm6kva1Iv93hTcSSqUbKiLM0czlyAxumSVekZoRGM=;
        b=H/Tl0KpyFW72HKbe1s7YWH0H0VHRIZsrKm9vJ7b3cKwLwC801lDcqI2lUQZXKwpXVe
         tWi8MOodrcWLYUG/W1uGrrDxirzxyI8zP3Iz3ZO3uT5Eg/3sObyuff0m7thrEzf9RKz7
         beWu+aybohkdIqIkoDLY1hDtE3E06NfF3qUUFq9yPqHvUpRerTN+U9cAmKETL18071PU
         NXF+TH8SvQgfG3Ma8ZRvd7sspwsjJcjZAenlQpMbo+g/DxHw/1cZeeOXgXWprAU3NjIZ
         EJjnkJh6P94qZUNkefnyMnq5RRHKNehDRXosEAFEuIj7whrbONCwHXtmAXyNvT6ed5vf
         hIOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794297242; x=1794902042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tRnQd2LIAHJZoonewpOl9i62ZvqjRvQNSGRPP0Ehga4=;
        b=KR/ttua9WVVtEV31IhwACzFjT/QUSzQb7hS5bfp6Hk/be6txNbSJyewt92CZTR3zYO
         I1MUBS3/X7oQH971Iay8kcmo3nvdFu2pJ58dQ7j+VNNEwf82ukFKlAnvXDGVtP+CVktB
         qAviX+/2agEGfaya918PKr/f3DJJWKqVF0EwrsiS0RZvvonXdKoG5aJG8rZkIN0iJuek
         YOFpGxgy9m2/OmAUkJ5yxXQadkDAjiI2d9qLF7woUTR8lAjojBbUbHNFuX6Gm205/94r
         eivXLSioxNCwDZEIO09v21ifl7z448SM5FSAAyfOIplhpdiSt+9fezWO19cOpWI+fB+Z
         6jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794297242; x=1794902042;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tRnQd2LIAHJZoonewpOl9i62ZvqjRvQNSGRPP0Ehga4=;
        b=N3YL9y7ME8i6mrUzG2Uzw5nNdZNW2KdTJzd2etNcDUWmZggG+lSvg/XgK3gMof4/RW
         3eTBfYipTJ3DWgbA9oRwB0IFrq20jhmJ9fwc6MsxktVwPKal6laeNEI++btvLvO/GIr3
         hz3AYyUWvwuZgkZjYahiuchjhVekHbu66mJoCI71EEei1G7Q0G8diAl7q7ImyNO5XtbS
         5Y1wQhOKGABPXpw2NsCfFjihelflYFETiN2JgBkQZ2oJTyNgZWl8ZtMiQd6uH2e+yG02
         21UJwySb07xTq7shOMBIlWtqZiYhgYt6vcShHKoQPCtaOXsaAryQdQ/0IxtGsFjDzTIQ
         Uwdg==
X-Forwarded-Encrypted: i=1; AL+hErE1KSwL2NFc/uWefP39Ncu03cUZNe5CZ6qP9hlxgblIfgnJm4FiTafmr6FplRFXBXRSKJQDbcy36cydzid6geRVOcJP@vger.kernel.org
X-Gm-Message-State: APuU4Z97uCL8OHhfKYJcHQ1FLrGDBSyys2Trbk+KCCvbIrVAfq6qc9DU
	RQOrEfII4OzYTiipn6an+TlniwXfxJbMji3h8rLWgYtucfAtkhRUcvA0lbYxGSF+dvyP7Tmmj/k
	mXJGxVExAEbKpsnV+spVwUnnPj6XNWDU=
X-Gm-Gg: AYBFou2WRyq9f/uSH9LMo5cyJal43uvAsIW3I7kfVDVcqtc8RQwE1DpLBZ8nJk4tEGU
	ICksinf2Fj3Az5ha3N/FkBz3gdlda7/CPF6K0+iyYs7SseA3M3nWCZwrtW2rzv4NkR8+pbTj7yK
	toLE1mJazIrXOGNmBpGv32WfJyY2OAh5V54notDkRcGge5jIRjw40CkuWSaRee1A2jHACTyHfBw
	lwLQaooAIPc4XwO6S0QqWtB/+5DnqSAz83ZZNYAulnw+Z7DoIQhCWPYlT/iu4k3RC2yUHe1PLtz
	0x25flUBjBn/DDm+6pP3JcX+WShxKRzvY6Uj10GR9nwxVlrF24GdU4SAA2vD2Zt02IGAnrKKnPE
	gUNLG00bb/Cp4UQnOdsNv50IWciwXBOZgHuEFzkdyVm5z3W+CQxChAI9nRDM9zj7bzOTl6IXE7p
	O4cn55qN8xdrS6bLc=
X-Received: by 2002:a05:6122:4902:b0:5de:ee96:75b with SMTP id
 71dfb90a1353d-5ee0d0dd877mr666952e0c.12.1794297242226; Mon, 09 Nov 2026
 23:54:02 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAABLQ8qdSC1r=-et0y6qnEjNE-FCvoT8wxbo6R9vmW5=bUOSgA@mail.gmail.com>
 <b7428de0-c009-45a3-a2c8-0722ed7bce6e@app.fastmail.com>
In-Reply-To: <b7428de0-c009-45a3-a2c8-0722ed7bce6e@app.fastmail.com>
From: qvkap <qvkapp@gmail.com>
Date: Tue, 10 Nov 2026 10:53:45 +0300
X-Gm-Features: AclHuK9ctTwCxK72RVhcE_CebgxLAWqeNM-n7dc1E4dE3ZDjJNTKTbGvKZcSQvw
Message-ID: <CAABLQ8qu5Wk0JpQwbSvNdQ_SWOtqHGA6HcQ_+xg013EcxxBK+A@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: add no_rfkill quirk for
 IdeaPad Slim 3 16IRH10
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Ike Panhc <ikepanhc@gmail.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback and clarification regarding the DCO and
submission process.

I have updated the patch to use my full real name (Ivan Vasilchenko)
in Signed-off-by, removed the external GitHub link, and prepared a
proper inline v2 patch below.

Regarding Mark's comment: I agree that modern IdeaPads/ThinkPads no
longer need ACPI rfkill and that a broader solution (or module
parameter) would be great long-term. Meanwhile, this quirk completely
resolves the erratic Wi-Fi/BT disconnects on this platform.

Please find the v2 patch below.

---
From: Ivan Vasilchenko <qvkapp@gmail.com>
Subject: [PATCH v2] platform/x86: ideapad-laptop: add no_rfkill quirk
for IdeaPad Slim 3 16IRH10

On Lenovo IdeaPad Slim 3 16IRH10 (83K2), the EC/ACPI firmware reports errat=
ic
rfkill radio states through VPCCMD_R_WIFI and VPCCMD_R_RF, causing periodic
soft/hard blocks of the native Wi-Fi/Bluetooth interfaces (iwlwifi) without
any physical switch or user interaction.

Add a no_rfkill quirk and register IdeaPad Slim 3 16IRH10 (83K2) into the
no_rfkill_dmi_table to bypass ACPI rfkill device registration and let the
native wireless driver handle radio state management.

Tested and confirmed working on live hardware.

Signed-off-by: Ivan Vasilchenko <qvkapp@gmail.com>
---
 drivers/platform/x86/ideapad-laptop.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c
b/drivers/platform/x86/ideapad-laptop.c
index 2c9e78a609d8..e393a525da5f 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -148,6 +148,7 @@ struct ideapad_private {
  } fn_keys;
  struct {
  bool set_fn_lock_led;
+ bool no_rfkill;
  } features;
  struct {
  bool initialized;
@@ -1245,6 +1246,9 @@ static int ideapad_register_rfkill(struct
ideapad_private *priv, int dev)
 {
  int ret;

+ if (priv->features.no_rfkill)
+ return 0;
+
  if (!ideapad_is_rfkill_hw_present(priv, dev))
  return -ENODEV;

@@ -1588,6 +1592,15 @@ static const struct dmi_system_id
set_fn_lock_led_list[] =3D {
  {}
 };

+static const struct dmi_system_id no_rfkill_dmi_table[] =3D {
+ {
+ .matches =3D {
+ DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+ DMI_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Slim 3 16IRH10"),
+ },
+ },
+ {}
+};
+
 static void ideapad_check_features(struct ideapad_private *priv)
 {
  acpi_handle handle =3D priv->adev->handle;
@@ -1596,6 +1609,9 @@ static void ideapad_check_features(struct
ideapad_private *priv)
  if (dmi_check_system(set_fn_lock_led_list))
  priv->features.set_fn_lock_led =3D true;

+ if (dmi_check_system(no_rfkill_dmi_table))
+ priv->features.no_rfkill =3D true;
+
  if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"))
  priv->features.conservation_mode =3D true;


--
2.45.2

=D0=B2=D1=82, 10 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 04:0=
6, Mark Pearson <mpearson-lenovo@squebb.ca>:
>
> Hi,
>
> On Mon, Nov 9, 2026, at 12:02 PM, qvkap wrote:
> > Hi Hans, Mark, Ilpo,
> >
> > On newer IdeaPad models such as the IdeaPad Slim 3 16IRH10 (83K2), the
> > EC/ACPI firmware reports erratic rfkill radio states through
> > VPCCMD_R_WIFI / VPCCMD_R_RF, causing periodic soft/hard blocks of the
> > native Wi-Fi/Bluetooth interfaces (iwlwifi) without any user
> > interaction or physical hardware switch.
> >
> > This patch introduces a no_rfkill quirk and adds IdeaPad Slim 3
> > 16IRH10 to skip registering defective ACPI rfkill devices. Tested and
> > confirmed working on live hardware.
> >
> > GitHub: https://github.com/qvkap/ideapad-slim3-rfkill-patch
> > Raw Patch:
> > https://raw.githubusercontent.com/qvkap/ideapad-slim3-rfkill-patch/mast=
er/0001-platform-x86-ideapad-laptop-add-no_rfkill-quirk-for-.patch
> >
> > Signed-off-by: qvkap <qvkapp@gmail.com>
>
> I assume posting a link to a patch is not going to be acceptable (I almos=
t didn't bother looking at this one because of that because I'm behind on m=
y overflowing inbox) but I'll let the experienced maintainers comment on th=
at.
>
> I've been looking at a similar issue on Thinkpad's but have been trying t=
o gather data on which platforms are impacted. We're finding the same thing=
 there where the kill is powering down the device and it's never recovering=
 - and we've been fixing FW for the last 3 years to make the APCI method a =
no-op where it has caused problems. Recently the FW team complained as the =
ACPI method is used for debug testing...so trying to find a better long ter=
m solution.
>
> I'm not a fan of the DMI approach as I don't think it's going to scale we=
ll - it means every new platform is (likely) going to need to be added; whi=
ch is going to get really tedious fast.
> I don't think it's really a FW issue and more a fact that device drivers =
have caught up and the ACPI rfkill is no longer needed - but I'm guessing a=
 bit. For Thinkpad I did get confirmation that it's not used on Windows FWI=
W.
>
> I have a patch that is almost the opposite - I was going to disable the r=
fkill mechanism unless a module parameter specifically enabled it.
> My logic is maybe some older models will need it - but so far in my testi=
ng newer (5 years or less) seem fine. I've been unable to determine the cut=
-off so far.
>
> If anybody on the list has opinions let me know. Gathering data on the im=
pact is taking time (sadly in short supply)
>
> Mark
>
