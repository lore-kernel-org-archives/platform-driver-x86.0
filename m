From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH v2] drivers:platform/x86:Use ARRAY_SIZE() for the size calculation of the array.
Date: Wed, 13 Sep 2017 12:02:11 +0200
Message-ID: <874ls6kjbw.fsf@miraculix.mork.no>
References: <1505292855-27476-1-git-send-email-allen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:45095 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751317AbdIMKCZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2017 06:02:25 -0400
In-Reply-To: <1505292855-27476-1-git-send-email-allen.lkml@gmail.com> (Allen
        Pais's message of "Wed, 13 Sep 2017 14:24:15 +0530")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Allen Pais <allen.lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, souvik.k.chakravarty@intel.com, platform-driver-x86@vger.kernel.org

Allen Pais <allen.lkml@gmail.com> writes:

> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/platform/x86/intel_telemetry_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/pla=
tform/x86/intel_telemetry_debugfs.c
> index d4fc42b..6b63b3d 100644
> --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> @@ -76,7 +76,7 @@
>  #define TELEM_IOSS_DX_D0IX_EVTS		25
>  #define TELEM_IOSS_PG_EVTS		30
>=20=20
> -#define TELEM_EVT_LEN(x) (sizeof(x)/sizeof((x)[0]))
> +#define TELEM_EVT_LEN(x) ARRAY_SIZE(x)
>=20=20
>  #define TELEM_DEBUGFS_CPU(model, data) \
>  	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data}

What's the point?  Why not simply replace all instances of TELEM_EVT_LEN
with ARRAY_SIZE?



Bj=C3=B8rn
