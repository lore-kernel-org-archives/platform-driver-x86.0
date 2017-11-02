From: "Edward O'Callaghan" <quasisec@google.com>
Subject: Re: [PATCH v12 01/16] platform/x86: dell-smbios: Prefix class/select
 with cmd_
Date: Thu, 2 Nov 2017 11:30:28 +1100
Message-ID: <CAD584itv8YusWzLwAd+K56ZBtL3APEYWS7ObEYK54CcQ59kCRQ@mail.gmail.com>
References: <cover.1509561822.git.mario.limonciello@dell.com> <9b1448731683c407ae1a05c5dcfb9aec1102724a.1509561822.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:52613 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933093AbdKBAaa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Nov 2017 20:30:30 -0400
Received: by mail-ua0-f193.google.com with SMTP id i35so2779274uah.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Nov 2017 17:30:30 -0700 (PDT)
In-Reply-To: <9b1448731683c407ae1a05c5dcfb9aec1102724a.1509561822.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, pali.rohar@gmail.com, rjw@rjwysocki.net, Matthew Garrett <mjg59@google.com>, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

Reviewed-by: Edward O'Callaghan <quasisec@google.com>

On Thu, Nov 2, 2017 at 6:25 AM, Mario Limonciello
<mario.limonciello@dell.com> wrote:
> Later on these structures will be brought up to userspace.
> the word "class" is a reserved word in c++ and this will prevent
> uapi headers from being included directly in c++ programs.
>
> To make life easier on these applications, prepare the change now.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-smbios.c | 4 ++--
>  drivers/platform/x86/dell-smbios.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index e9b1ca07c872..ffc174638aa4 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -86,8 +86,8 @@ void dell_smbios_send_request(int class, int select)
>         command.ebx = virt_to_phys(buffer);
>         command.ecx = 0x42534931;
>
> -       buffer->class = class;
> -       buffer->select = select;
> +       buffer->cmd_class = class;
> +       buffer->cmd_select = select;
>
>         dcdbas_smi_request(&command);
>  }
> diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
> index 45cbc2292cd3..742dd8bd66b9 100644
> --- a/drivers/platform/x86/dell-smbios.h
> +++ b/drivers/platform/x86/dell-smbios.h
> @@ -22,8 +22,8 @@ struct notifier_block;
>   * system management mode, hence the volatiles */
>
>  struct calling_interface_buffer {
> -       u16 class;
> -       u16 select;
> +       u16 cmd_class;
> +       u16 cmd_select;
>         volatile u32 input[4];
>         volatile u32 output[4];
>  } __packed;
> --
> 2.14.1
>
