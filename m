Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BC3C2BB3F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 16:28:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjKTQ2e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 11:28:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjKTQ2d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 11:28:33 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C77909E
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 08:28:28 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-77897c4ac1fso304980985a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700497708; x=1701102508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoEE83J5zqiXR9b9VDBnDTxQ/CW+PgfZ81uJ0uOUoQg=;
        b=CdivwS+nVfK3wp264PiLvAVRIy0igtqyX3ycMpk5VNMrNKZkSbBmpKPsoblmtRW2ng
         kSSKPgGkP9kJaR4HENqDtSJG58QlmvtdY8nRIBAsjcDTG2V2OtdHIkJ3zAlkOxGwwPz/
         bG8/9cisNxMvQMX0F2HZL5VHJGdgAMWu0LiA4zjT1Hn3nQdzM/2eqEVCZbu5EprbBI77
         IkPHsOwxR9/s8dvzTpgHjJu4h1Lq8Le/6MygJ7Hwlr4HAaPzs/44JSM5EUXRH2iOA5ul
         kOUU/1DDzc8K2PyHzRJREUHq1j5t8O1AYEXMt94x71lOX+LDY7gFZJwtUGZQAGbFwpa7
         6TIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700497708; x=1701102508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SoEE83J5zqiXR9b9VDBnDTxQ/CW+PgfZ81uJ0uOUoQg=;
        b=IrC9jLn/6Li+4LXKTPKSaJGsyd+5MNO8mRCIToeXgiquA1QtnMp+L/UBdcHQmJr3Xt
         ekbtVFnY7T08HlibaPwn6uStY6pRi6GwVuC23tuEb6GsunXk46LTGmm0ALZdHZba7969
         ZtwXf4Al9ugeg9MmUnRGjPdMK0G5mAYSipg4lsRi0qAPNWl+KiDCaB2illTESnk0kJ28
         RjyYFIf8aXQXd+dizj1+1T8/S7ezpRajRYu0VlHqj8oQXf4//twZD45RkGoVrGS2UGTg
         FWgLlFxHGpPHCZ9WPWRyUFlV6RM/wp6BRgyAILhSCTBZkVgBSBEVhZXVQop95MQngEiX
         +33w==
X-Gm-Message-State: AOJu0YxVr1soIkAvJrKSJE7CI/sR5X8jurrlZZg4E2rihr5Drq7QNwpR
        1A18S6E4eyS4wuXzGqLHvY56yYhTlxDreuaALoQ53YiUSN4=
X-Google-Smtp-Source: AGHT+IE39nVDcr8gSEHGX46ddKFuAJ/1mUy3hy5eQANWrYN0KgQBclkxabCrwoZ5UmDzoiexHwD2BF8tsN5StxOZCXo=
X-Received: by 2002:a05:6214:621:b0:66d:36fb:474d with SMTP id
 a1-20020a056214062100b0066d36fb474dmr9227401qvx.1.1700497707849; Mon, 20 Nov
 2023 08:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20231120154548.611041-1-hdegoede@redhat.com>
In-Reply-To: <20231120154548.611041-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Nov 2023 18:27:50 +0200
Message-ID: <CAHp75VeUZBkkJO73beYPnAWKpSdPWa+6RzpS7ksyxuUgR5aS1w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Drop Mark Gross as maintainer for x86
 platform drivers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Nov 20, 2023 at 5:46=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Mark has not really been active as maintainer for x86 platform drivers
> lately, drop Mark from the MAINTAINERS entries for drivers/platform/x86,
> drivers/platform/mellanox and drivers/platform/surface.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
