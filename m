Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABF7C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Feb 2021 13:21:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94ACF64EAD
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Feb 2021 13:21:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhBRNUH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Feb 2021 08:20:07 -0500
Received: from mout.gmx.net ([212.227.17.20]:43419 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231995AbhBRLIL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Feb 2021 06:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1613646396;
        bh=VwlTApMp8DF+63HmIj6DOF1K+irwKqX6DMCR8HIulP8=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=Yd+m+x4HLXbaxZdPvDpco2np7OimPUZg/hzhIWVsisjxYN48UdyG1XzitAw7FbLx2
         8tlMqxx1IewvOMteWq4/AqOEoeXSBLDVC6/8g4rOmj7zlctfoNFeHPwEVIJjJPBmDE
         3Ka6+5xbkN400NzzBN0qhB5UC5IAe3+qoWkB1B8c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.10.160] ([79.200.198.71]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1lvMIO1lYE-0184DJ; Thu, 18
 Feb 2021 11:57:46 +0100
To:     divya.bharathi@dell.com, mario.limonciello@dell.com
Cc:     platform-driver-x86@vger.kernel.org
From:   Alexander Naumann <alexandernaumann@gmx.de>
Autocrypt: addr=alexandernaumann@gmx.de; prefer-encrypt=mutual; keydata=
 mQENBFHyVjkBCADAn/Pi+LQwfLTF6LlTO3iZImlG6194GmeSIP35pWjqdUX8D6f+9sM34dRg
 8vugNTRF/QgcFZT4hk+SP8I5h+E2in/lZXdPKvnS/FGWU8768SMVUFdv7wNpVVJ4cok9KZ2w
 vIDsvI6nNlwD9ktdEVuXqVsnbuyXQ5oRrXwftUOtEbPgXjqKoFjp2ADiS689YTeXbT2OhrQH
 BZ4x0J3QxVggqvKYaUnG09q6DbWH95CL4J03eotlen07/lBBqLaoFK6rBA3M67cqntpgpFA7
 pwmDNmaxfsmqE9FiimS/1LS4xrZ+TNu3XqVqRec9QG8EpJpt/4nbY5wDAxk/jE9rI2zlABEB
 AAG0K0FsZXhhbmRlciBOYXVtYW5uIDxhbGV4YW5kZXJuYXVtYW5uQGdteC5kZT6JAU8EEwEC
 ADkCGyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAFiEEqkCOgb0FadYTrK5vgjQuacJeHpwF
 Al7OOkIACgkQgjQuacJeHpwx+wf/Zc0vigQLYUi/ozTI3Jf2cPOPwGNtcA73bXszpm2t4Pl2
 0PemDqrg5rfREC0N2lBebymP9cfczAlsxlrIYRZg0mxTlLPf6nqKwVuQii9LWKMsRu39Kkwb
 TJXwaCqqXUUTI5t0AY7XFDwXEfq2AUxkmJk0YcwbN8/0F6vCz6rvr/Tzm0QhNEtk1SacpmPr
 AI6lj3iqcE4XGbeIGWykJySmVpaAamaMc5mVFve1mU/SUOSpG9H1LwAM4ZipN4Kjv/nmb3rZ
 rcAd1iOA/vH7FwTaHNeO+46Q0N0ihsWLJaABCrXaq7BWq/b+jqEb80KUp3sxO9NSaytaCN67
 uF4PH5m5IrkBDQRR8lY5AQgAu/hKLzWfto5/iP0JLuTGzAXdeR1DqTGbRe/EYlfSSOq4Dtks
 dTbcQGn5ri7kIyZcr/iRXLHiVXeSIz4ov2++PQ+q6p0UFY97ctX9zCs1uyzHVMpr4uGsCzzh
 pVeyw5TjpRBHtTrucahZ9NjUcH05PLTIh4jlzA1X/OVsAjp9DHIVXC6hOgZNJqOWP3cdTWux
 6Yr8JprgKoIVJ6yU7uT7Gl6hk1HV7ou+/i5m+iVmXCA+Rui2/1bbFd6dl+jkdBF1tR5zpC62
 RTWiEbMpEAFk+QkIxdZLY5Yb7AM4a91MZk1BoIelMgzNXb6CNZATZ56oVJkKl1cqh2OhjxSk
 DS/YuwARAQABiQE2BBgBAgAgAhsMFiEEqkCOgb0FadYTrK5vgjQuacJeHpwFAl7OOkMACgkQ
 gjQuacJeHpzTVQgAvIH8gdMskOjwl3dr2U6FzYx7tj3r4j7HDdqxmIGYE8L28n66uRhxxAYM
 aUy4mZP3VC2sj4G3z2SrTVjUWIB9YfTyWieRo85+7FHugzLMCLm5RV5UYpugFKn61sV8vIOe
 D3l2XHvmGmlwtscR5IY1YRqhMLgxTr52EwkkKrZpopL8YO4fTS4iu3tYLag3xKjBP5HDqaFh
 qxmE8N7Mt38PzWugy9SAWw9lvp8TUQHdQ3VxJEl7OaAY83+GATyvjKX7Md/0No8H/BupSsZB
 bWO8nJru/2C2fsLcW8tFGc7p8JSQNqePThpjo4Wtgjq0lK0Sf4TvqKCx2GssFU0T9orO4g==
Subject: dell-wmi-sysman: New possibility to set BIOS values for Dell systems
 has some bugs
Message-ID: <14c6da2c-1e8f-294c-a11d-1656a611d7d8@gmx.de>
Date:   Thu, 18 Feb 2021 11:57:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-Provags-ID: V03:K1:5Cd3fcTeNzTtnhEWXd3ujh0pCGXFbO+WsrminYhR551MmzqFdsv
 S2g4m3wVl+jRUJttSr+tSFNA9hSaHUE9PhJHuEgz5sS/Zzs+GZP6FlPnxljYaIc2jVgs4dw
 82plMiP0tUWUxEo/1Gv44XGxOsCkb8qcY0czncgOdpAZm2JJ0jrlfzinYg+Ry/fW3VAbaWo
 NPwXz+BWLb+9CW1biZtrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a54uvmUy6Jk=:Rgae68qCY0jbTSqrtIAdr3
 LB10MYPMZZl91ylSOkH1ufIikfEiKLCGHfMhdnKlXBhur2JEbLOpDVIpc0ZdHM42jU2tV2B0r
 Jc4inDibE+taQ4bu4nSagHN7P0Z1r6P6hyowW8t/aQRQWlj4KjV+8EnRD7xE898fDZtM+mfEP
 eV0HtbCiy/5cxfq3sI8dawjzhs92/2yjn0+OXf7eGMa8PLvi3hw0KTCSjwJxgRpARxnrjqEdF
 xPyj54n+x6SI2wjQxQ1btkJcyTS94/lv0n9l9FcGDgn8xZmlcljOLcf7IQ9ELFw1hJujxmvpJ
 t2QXwrbYimzOqtQJATQZcd4WVEioqB6fcesHN1CpOQ9G5bKCfUk6Me0Z1KYt9MRGo88m8Lmeq
 mX3hT0lUlyIY/KkUiLrFtHOQD+cORaWrbX66SM2lY6YWrtvctSdd0Czv40j52WUcjGPxmZ8ir
 J4aaBaww8k8eAgFVu8MHrVmiqIPVJFRiwKY+C/Qp9rPIjyZT8MXJ3OO5Gl78ZApPbJFTZ8J0K
 u/vfRFhZsaDTmHq4x7vYgS1D6oIxt32X9aW+dnhM7dhfBvHtnunpY4zqzHXEFi3+w8tpdgaq6
 w5Cx/fwGMyomVLkiMpw0OzrQkPM2er5fRwb1bdNtuGh4AsBbVR7/McFhllkvmFaj0uwBGMx6J
 mISjTq+njoLMXx9XrxT+q9YKjANR46eyUnTm5fG+sZN8A/l3LSjEIqLbQDgDYG2stAWbevhcg
 gPk+5cHYuYsHXibrvJZrAEww4l/kfvk1/D//Cd605VDlAwi182VYlTFrmdGUVaUB2VC8pYqyA
 mMa7eIQxcoY8gP7ExgUS2X1/ESrhXZ6+b9otOoPBhiav9gF0SIY4CfNIZzBE3r0MzcNglSRHO
 EBuVDETYs7X6Fss3mLng==
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I have seen this new option and wanted to test it on an R240 (OEM device)=
=2E

But it is not working.


I did compile this as a module and it was loading fine. But actually it
is not.

This function call here returns 0:

ret =3D init_bios_attr_set_interface();


But "wmi_priv.bios_attr_wdev" is not set!

So loading the module is returning with exit code 0 (what is wrong!).
Variable "ret" should be set to 1 in this case


Also unloading the module will crash (I guess because the sys entries do
not exists).

I can send you an crashdump later on.


Any ideas why it is not working at all?




