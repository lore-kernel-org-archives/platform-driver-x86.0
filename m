Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84927C43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 18:17:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42849221F1
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 18:17:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HvDek7Fc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgIQSQ2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 14:16:28 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39629 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726634AbgIQSQ1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 14:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600366584;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XB5+Bmzk2zRJ6QJXBjVut5QgAuFDyrBjoFWGrk/SghM=;
        b=HvDek7Fc26tj9fuI8CrysrPf3JhekMesb0lfOyR0pYIwMs9k4O5B116P2rvx0+gVIseDij
        U2vHENacTYypIjmZsDNbgj5yIhLQefQNOT6FjHSYXc/WS3EPEz2lWMcZPniMnNlNbcSG25
        odI6uwJoIp9yodCfw8vk9crzU2ilP+k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-NZYj4lPCN4mGhUKBgzpGKA-1; Thu, 17 Sep 2020 14:16:20 -0400
X-MC-Unique: NZYj4lPCN4mGhUKBgzpGKA-1
Received: by mail-wr1-f69.google.com with SMTP id 33so1202275wre.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 11:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=XB5+Bmzk2zRJ6QJXBjVut5QgAuFDyrBjoFWGrk/SghM=;
        b=tCGpGX5fqbFkfpw9X8XeyjorEDFmD+r6dyhptPtmoSbGSHpgzR5DThL+8CSdCnibsw
         hAwgn5x+ZKNPQkqaoHGQfpPWB142JgYS+3dZThVb9kvNmtOdMmiR+8BnEH+4lSVXGIu9
         4Wfm7h7VBHxO2SESIsdbd47FTzJohJNM8tpjkCZzunIgWdTbZy2Wa9QQAdlzogkdapcw
         NvPTkhWzLdGRyWKemK2hQbIy3DZ0DC1AWwQnLl3J3qZQgDnwOZptbDCrkWO7Fu5GwuKD
         Vz15XBHcPfsh01b8/IyrOE9NSR5beuGiWzcwbBMPrkysWwru5mkEGSaYcXg31N3jwCtr
         tvTw==
X-Gm-Message-State: AOAM530LjRbGbcIj/szJWbyLMW2h7X4+yR2I9xFWN3wHbzor9M9x86y3
        sSvqHu1juvrpeWqlozpS2Q8B9xAAtzRASm/qK+BGaTQtJm+9imisUblFw/fJxpG2z5uxoqdLum/
        Fqqy3UUM86/tMGZrsMWd8vLQ+9QptQu0zBw==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr4807330wrn.110.1600366579418;
        Thu, 17 Sep 2020 11:16:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXjWAgRuWkNKf59qMNDFElrppxDJ0XYeo6KcsrjckJMmzevMZdYokLSTCIFQeBZ7V1MJy/Wg==
X-Received: by 2002:adf:ce05:: with SMTP id p5mr4807311wrn.110.1600366579228;
        Thu, 17 Sep 2020 11:16:19 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id v204sm423922wmg.20.2020.09.17.11.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 11:16:18 -0700 (PDT)
Message-ID: <261328975238951d0412727220a1b7d915cebb99.camel@redhat.com>
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
From:   Benjamin Berg <bberg@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu, 17 Sep 2020 20:16:16 +0200
In-Reply-To: <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
         <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
         <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
         <9f01ce60a6b3319855f6a26b94af3e5fc6d2595e.camel@redhat.com>
         <6e0409e7-5bc2-4ca6-a0aa-725a9a91aa8d@redhat.com>
         <83694d5164a32d1ce6cdafb9cb73d731ca4b4a78.camel@redhat.com>
         <0577bc9b-aa9f-c4b6-bac6-64325d81eeff@lenovo.com>
         <c06f214d-ca9d-9ca3-236a-82a0bacfb582@redhat.com>
         <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-qGvs1NhDzAqHr6lNa3G1"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--=-qGvs1NhDzAqHr6lNa3G1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-09-17 at 13:16 -0400, Mark Pearson wrote:
> > As I understand the problem with the configured and actual=20
> > value/performance_level ideas is that if I understand things correctly=
=20
> > that H* is not the same as M,
> > it behaves close-ish to M because of the lower thermal-limits from=20
> > lapmode, but if I understood Benjamin correctly is is not exactly the=
=20
> > same, so if we were
> > to advertise "M" in the actual_performance_level sysfs-attribute then=
=20
> > that would not really be correct ?
>=20
> Just a small clarification - in our case High performance is only for=20
> deskmode. It drops to Medium in lapmode.
> Medium mode is slightly different in power rating between lap and desk=
=20
> mode (e.g on X1Carbon 14.5W on lap, 15W on desk). I haven't really=20
> worried about this in my patch implementation - it's still "medium"

Hmm, what I saw on the X1 Carbon 7th Gen was that putting it into
performance mode (H) increases the fan speed. And I believe that this
was also the case while it was in lap mode.

Specifically, I believe I observed that changing dytc_perfmode from M
to H caused the fan to turn on (and vice versa). So while CPU power
limits are very similar, there still seems to be differences in the
active cooling behaviour.

Benjamin

--=-qGvs1NhDzAqHr6lNa3G1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl9jp/AACgkQq6ZWhpmF
Y3DU8w/+J7hNKAWziO8BC/8uedNtCC8xYdGFWxjQtHY2I2retI0Ob9rcubiV1bPs
cYbS4nzE2bpQA2jFncXYmygUp99Ekg7HdFyj6HvUoDIvgXvlXkMIFQZFdeSOFZLR
9jGx8J4eU+h9609EtAaaQkbqQ7Y67sKMH0D6bdQw2wBRyYcSdjAWv7ukc9jF3Fm1
VYOgjPRiZhwLJMAmlnVbWpOPd8sFycn9Y1gJk3h+Z4gaB2z3gvg8vOAkcfILP7ud
FEFLqQ3Itg2Q2/MVdF3Sn3jzKgbj8lAq1c3SdMDPorXcssmV0rkuJKOBvmWt6aUW
Ro4kZd+zFId3PHw2gpe/ICbsG0YOIFfsPXzlEdpMwLe6l9WtspPA/ZFb3m7HbtQI
DtBvjK1VDqEsRbCsCM/iIQQyzajgBGDHdry2iD52+NWwpe0tDnz7rG2ggeeMiLx3
zI5VlwZGmasY5SxKzrrpKlw7Cl0A15UXrCh0UwtL14eUX8qT2EmgDUFZGvOE470I
e67w5AP1oD4beoUsTeoq0nBj1rwRN0OIHTbsrmgDZPyJC6WauO1YDt3SS3c+xrK+
skxyYXaiBEeZlCoDFV1uEPSg1oMNIY7fw4d2oNera0bmTMrCyOd1UOGG6JBuUvwL
rn9U6Eplx6s5X7sA17cWwtNjkMezU/expG7ekgsEkOPPEFkypU4=
=I6lW
-----END PGP SIGNATURE-----

--=-qGvs1NhDzAqHr6lNa3G1--

