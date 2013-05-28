From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: Patch for thinkpad-acpi.c
Date: Tue, 28 May 2013 12:28:19 +0200
Message-ID: <87r4gr9z5o.fsf@nemi.mork.no>
References: <51A47773.4080701@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:45399 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755617Ab3E1K2i convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 May 2013 06:28:38 -0400
In-Reply-To: <51A47773.4080701@canonical.com> (Bruce's message of "Tue, 28 May
	2013 17:22:59 +0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bruce <bruce.ma@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, linux-kernel@vger.kernel.org

Bruce <bruce.ma@canonical.com> writes:

> +struct blacklist lenovo_blacklist[] =3D {
> +  {
> +    .model_s =3D "Lenovo LM490s",
> +    .nummodel_s =3D "814YG01",
> +  },


The driver already has a list of LED support per model in the=20

  static const struct tpacpi_quirk led_useful_qtable[] __initconst =3D =
{}

array.   Why do you duplicate this with lots of new model checking code
instead of just using the code that's already there?

>  static void led_exit(void)
>  {
> +        if (no_led =3D=3D 1 ) {


The driver already has provisions for signalling that LEDs are
unsupported through the 'led_supported' variable.  Why do you add
another variable, and duplicate testing in every access function?

But I don't think this part is needed at all, as long as you set up the
proper LED map in led_useful_qtable.



Bj=C3=B8rn
