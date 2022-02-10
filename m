Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A80C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Feb 2022 20:32:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238570AbiBJUca (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Feb 2022 15:32:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbiBJUc3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Feb 2022 15:32:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE02CB85
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 12:32:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8B7B6B8273A
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 20:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F64C004E1
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644525147;
        bh=4RiS7KNrXGjPyLhTHTT2MXIiROOeoCvVXO7I2z1/Tfk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=a1rWRQ1mjvffYhmBJ297gv9j/SUPdfFIqfkd6xyqfhhEo+Wi7pQ+NZ2J3qtwV4ZZL
         iq9MtS2gPJF9ihd1uZTjB3p+ez4mszgZaHKkfjDvs6TcdNxLp8eEuSHhtzf4AAukI5
         /30y8ePls4rZgsxQCgKLNvZwORTd/z0dOhzSthj1dWQFqXHH2Csa1X0FNiS9y0CVh5
         E3Wg1pId+m286pZTwXH/uxNgR4lLnW3TU8ulBs1qqRIMXSJojUlUzXXGq9i0ySjHsr
         VTzgaVv/8qFw9jN5eONb8pwlqaRVfFRMC+NgqWrJrP5mZvSDmRmOlNOxgY50v1r4sK
         68kf26YBFMepg==
Received: by mail-yb1-f179.google.com with SMTP id x136so17166093ybe.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Feb 2022 12:32:27 -0800 (PST)
X-Gm-Message-State: AOAM531AmfFXghv2XjlqfNba+uR3Oc5hNf1sXI39e/74DwbA/a+peJHm
        MoGCKJqUJMTJ/bSTqEJ1JGec3aU8ai2xMruX00k=
X-Google-Smtp-Source: ABdhPJw9vVx4FJDWA1DvEMmuUCLJDZqaC2g8GVSJH3sug6HDuOfR+qUsqsj4pSyWgZDG2Ubeueqwfo3OUgAC9amMcWo=
X-Received: by 2002:a5b:54b:: with SMTP id r11mr9087021ybp.282.1644525146489;
 Thu, 10 Feb 2022 12:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20220209184406.99938-1-nchatrad@amd.com> <80fdee03-541f-21ab-711a-87045d8fd248@amd.com>
 <CAPhsuW5V0BJT+YSwv1U=hRG0k9zBWXeRd=E1n4U5hvcnwEV3mQ@mail.gmail.com> <94c67a8f-a4b8-8275-53f4-98b56bf9994a@amd.com>
In-Reply-To: <94c67a8f-a4b8-8275-53f4-98b56bf9994a@amd.com>
From:   Song Liu <song@kernel.org>
Date:   Thu, 10 Feb 2022 12:32:15 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7G18toN+LoHKEDa10UUUG0hD_RKHGi8nuJGRjDYVLJ_w@mail.gmail.com>
Message-ID: <CAPhsuW7G18toN+LoHKEDa10UUUG0hD_RKHGi8nuJGRjDYVLJ_w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] platforms/x86: Add AMD system management interface
To:     Nathan Fontenot <nafonten@amd.com>
Cc:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>, carlos.bilbao@amd.com,
        siva.sathappan@amd.com, suma.hegde@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 10, 2022 at 11:52 AM Nathan Fontenot <nafonten@amd.com> wrote:
>
> On 2/9/22 19:10, Song Liu wrote:
> > On Wed, Feb 9, 2022 at 1:08 PM Nathan Fontenot <nafonten@amd.com> wrote:
> >>
> > [...]
> >>> +
> >>> +static const struct hsmp_msg_desc msg_desc_table[] = {
> >>> +     /* num_args, response_size, type */
> >>> +     {0, 0, RSVD},   /* RESERVED */
> >>> +     {1, 1, GET},    /* HSMP_TEST */
> >>> +     {0, 1, GET},    /* HSMP_GET_SMU_VER */
> >>> +     {0, 1, GET},    /* HSMP_GET_PROTO_VER */
> >>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER */
> >>> +     {1, 0, SET},    /* HSMP_SET_SOCKET_POWER_LIMIT */
> >>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT */
> >>> +     {0, 1, GET},    /* HSMP_GET_SOCKET_POWER_LIMIT_MAX */
> >>> +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT */
> >>> +     {1, 0, SET},    /* HSMP_SET_BOOST_LIMIT_SOCKET */
> >>> +     {1, 1, GET},    /* HSMP_GET_BOOST_LIMIT */
> >>> +     {0, 1, GET},    /* HSMP_GET_PROC_HOT */
> >>> +     {1, 0, SET},    /* HSMP_SET_XGMI_LINK_WIDTH */
> >>> +     {1, 0, SET},    /* HSMP_SET_DF_PSTATE */
> >>> +     {0, 0, SET},    /* HSMP_SET_AUTO_DF_PSTATE */
> >>> +     {0, 2, GET},    /* HSMP_GET_FCLK_MCLK */
> >>> +     {0, 1, GET},    /* HSMP_GET_CCLK_THROTTLE_LIMIT */
> >>> +     {0, 1, GET},    /* HSMP_GET_C0_PERCENT */
> >>> +     {1, 0, SET},    /* HSMP_SET_NBIO_DPM_LEVEL */
> >>> +     {0, 0, RSVD},   /* RESERVED */
> >>> +     {0, 1, GET},    /* HSMP_GET_DDR_BANDWIDTH */
> >>> +     {0, 1, GET},    /* HSMP_GET_TEMP_MONITOR */
> >>> +};
> >>
> >> The hsmp_msg_desc, hsmp_msg_type, and msg_desc_table are used by the driver for
> >> validating user data. These aren't part of the user API.
> >>
> >> Perhaps these should be defined in the driver itself instead of being a part of
> >> the uapi header.
> >
> > This was my idea. While I agree it is a little weird to have these
> > tables in a uapi
> > header, I think it is helpful to give the user some reference about
> > proper num_args
> > and response_size for each message. I don't have a better idea to achieve this.
> >
>
> I like the idea to give users a reference on args and responses for each HSMP function.
> If this table is kept in the uapi header perhaps we should add a short description of
> what the expected args and responses are for each HSMP function with a pointer to the
> full documentation of the HSMP functions in the PPR.

I guess we can use unions do give full descriptions, like:

struct hsmp_message {
       __u32   msg_id;                         /* Message ID */
       __u16   num_args;                       /* Number of arguments
in message */
       __u16   response_sz;                    /* Number of expected
response words */
       union {
              struct {
                      __u32   args[HSMP_MAX_MSG_LEN];
               }; /* ensure size of args */
              struct {
                       __u32 test_arg1;
              } hsmp_test;
              /* args for other commands */
       } args;
       union {
              struct {
                      __u32   response[HSMP_MAX_MSG_LEN];
               }; /* ensure size of response */
              struct {
                       __u32 test_response1; /* or better name */
              } hsmp_test;
              /* reponse for other commands */
       } response;
        __u16   sock_ind;                       /* socket number */
};

btw: do we really need HSMP_MAX_MSG_LEN of 8? The list above
have at most 2 args/responses.

Thanks,
Song
