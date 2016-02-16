From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 3/5] dell-wmi: enable receiving WMI events on Dell
 Vostro V131
Date: Tue, 16 Feb 2016 16:17:39 +0100
Message-ID: <20160216151739.GK1476@pali>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-4-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:35513 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754633AbcBPPRm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Feb 2016 10:17:42 -0500
Content-Disposition: inline
In-Reply-To: <1455634230-1487-4-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 16 February 2016 15:50:28 Micha=C5=82 K=C4=99pie=C5=84 wrote=
:
> +	if (wmi_requires_smbios_request) {
> +		buffer =3D dell_smbios_get_buffer();
> +		buffer->input[0] =3D 0x10000;
> +		buffer->input[1] =3D 0x51534554;
> +		buffer->input[3] =3D 0x1;
> +		dell_smbios_send_request(17, 3);
> +		err =3D buffer->output[0];
> +		dell_smbios_release_buffer();
> +		if (err) {
> +			pr_err("Failed to enable WMI (error %d)\n", err);
> +			wmi_remove_notify_handler(DELL_EVENT_GUID);
> +			dell_wmi_input_destroy();
> +			return dell_smbios_error(err);
> +		}
> +	}
> +
>  	return 0;
>  }
>  module_init(dell_wmi_init);
> =20
>  static void __exit dell_wmi_exit(void)
>  {
> +	struct calling_interface_buffer *buffer;
> +
> +	if (wmi_requires_smbios_request) {
> +		buffer =3D dell_smbios_get_buffer();
> +		buffer->input[0] =3D 0x10000;
> +		buffer->input[1] =3D 0x51534554;
> +		dell_smbios_send_request(17, 3);
> +		dell_smbios_release_buffer();
> +	}
> +
>  	wmi_remove_notify_handler(DELL_EVENT_GUID);
>  	dell_wmi_input_destroy();
>  }

Hi! I would propose moving this get_buffer, send, release code into own
function with boolean argument on/off. This de-duplicate same code plus
decrease level of indentation in _init function. And maybe adding ascii
string comment representation for that 0x5153... number can be useful.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
