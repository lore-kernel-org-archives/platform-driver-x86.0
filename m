Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B6EEE0212
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Sep 2023 00:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231223AbjINAgx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Sep 2023 20:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjINAgw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2023 20:36:52 -0400
Received: from raptor.dennisbonke.com (vmi485017.contaboserver.net [161.97.139.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80668E6A
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 17:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dennisbonke.com;
        s=default; t=1694651805;
        bh=LORpKd3H5myWDyBj51ophuzA38zpn/zG2YmWBmfh1LQ=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=fJi4eazzXdVPfDSQ/PlyBJMp7wOfdvmPsABoaVPE0TMPEwul1L4RZQ++qnelYVrLP
         zUPZFWinm9r5/sqnnAadDvo0yB0cdPTU1bUIYhG6SxWit9YFIzh9LJiPdA5kkXcKC0
         dDQ1kmSIaiYxlimeCrgi+DZSbJPJ0hOcm+D2xN5qtIcuiIep7wsi6ZTMFf81vtbAJU
         CcKv+BjoXWzr8LUT2bMWCLCS+Wo6ugusr0OcH6sSBWRnNMhZ9gDd5NnRfWeTdhtmrk
         34oWb/OI6vKxPZvIWB5BUBa1SfkwsR7UP3sUSuTlVY1AQ1ipHTsM5Tq+SRDDm/WFlw
         KDU1OjL7MZbgA==
Received: from [192.168.0.107] (050-179-172-081.dynamic.caiway.nl [81.172.179.50])
        by raptor.dennisbonke.com (Postfix) with ESMTPSA id 00516A05B06;
        Thu, 14 Sep 2023 02:36:44 +0200 (CEST)
Message-ID: <b5246c7e2b81afe99bd146dd1209b1971b196a0b.camel@dennisbonke.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Take mutex in hotkey_resume
From:   "Dennis Bonke (admin)" <admin@dennisbonke.com>
To:     Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     platform-driver-x86@vger.kernel.org
Date:   Thu, 14 Sep 2023 02:36:44 +0200
In-Reply-To: <900bedba-378e-4215-8b88-27dcc6353164@t-8ch.de>
References: <20230913231829.192842-1-admin@dennisbonke.com>
         <900bedba-378e-4215-8b88-27dcc6353164@t-8ch.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 2023-09-14 at 01:33 +0200, Thomas Wei=C3=9Fschuh wrote:
> Hi Dennis,
>=20
> thanks for the fix!
Hello Thomas,

Thank you for the quick review! I apologize for the messy V2 that I seem to=
 have posted.
It's my first time working with a mailing list and it seems that something =
went wrong.
>=20
> On 2023-09-14 01:18:29+0200, admin@dennisbonke.com=C2=A0wrote:
> > From: Dennis Bonke <admin@dennisbonke.com>
> >=20
> > hotkey_status_{set,get} expect the hotkey_mutex to be held.
> > It seems like it was missed here and that gives warnings while resuming=
.
>=20
> Which kind of warnings?
>=20
> If it's from lockdep then it's triggered by hotkey_mask_set() and the
> commit message is a bit off.
It is indeed from lockdep. I've changed the commit message to reflect your =
comment.
>=20
> Also then the patch needs:
>=20
> Fixes: 38831eaf7d4c ("platform/x86: thinkpad_acpi: use lockdep annotation=
s")
> Cc: stable@vger.kernel.org
>=20
> With those:
>=20
> Reviewed-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
About those tags, do I add them to the patch? Just double checking before I=
 accidentally CC the stable list with an incorrect patch.
>=20
> >=20
> > Signed-off-by: Dennis Bonke <admin@dennisbonke.com>
> > ---
> > =C2=A0drivers/platform/x86/thinkpad_acpi.c | 2 ++
> > =C2=A01 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x8=
6/thinkpad_acpi.c
> > index d70c89d32534..de5859a5eb0d 100644
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -4116,9 +4116,11 @@ static void hotkey_resume(void)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpacpi_disable_brightne=
ss_delay();
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&hotkey_mutex)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (hotkey_status_set(t=
rue) < 0 ||
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hotk=
ey_mask_set(hotkey_acpi_mask) < 0)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0pr_err("error while attempting to reset the even=
t firmware interface\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_unlock(&hotkey_mutex);
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpacpi_send_radiosw_upd=
ate();
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tpacpi_input_send_table=
tsw();
> > --=20
> > 2.40.1
> >=20

