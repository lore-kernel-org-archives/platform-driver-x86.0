From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v3 4/7] platform: x86: Add generic Intel IPC driver
Date: Sun, 1 Oct 2017 17:59:20 +0300
Message-ID: <CAHp75VecDGzs=esey6hSDWMxvYPeeiy5T-9x6MNFaHspLq0ctA@mail.gmail.com>
References: <cover.1504588701.git.sathyanarayanan.kuppuswamy@linux.intel.com> <7d1a79925df8d2e35cfbd6974706d0d1ef0fc0de.1504588701.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7d1a79925df8d2e35cfbd6974706d0d1ef0fc0de.1504588701.git.sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, "x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Zha Qipeng <qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, "dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Souvik Kumar Chakravarty <souvik.k.chakravarty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Sep 5, 2017 at 8:37 AM,
<sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
> Currently intel_scu_ipc.c, intel_pmc_ipc.c and intel_punit_ipc.c
> redundantly implements the same IPC features and has lot of code
> duplication between them. This driver addresses this issue by grouping
> the common IPC functionalities under the same driver.

> +static const char *ipc_dev_err_string(struct intel_ipc_dev *ipc_dev,
> +       int error)
> +{
> +       switch (error) {
> +       case IPC_DEV_ERR_NONE:
> +               return "No error";
> +       case IPC_DEV_ERR_CMD_NOT_SUPPORTED:
> +               return "Command not-supported/Invalid";
> +       case IPC_DEV_ERR_CMD_NOT_SERVICED:
> +               return "Command not-serviced/Invalid param";
> +       case IPC_DEV_ERR_UNABLE_TO_SERVICE:
> +               return "Unable-to-service/Cmd-timeout";
> +       case IPC_DEV_ERR_CMD_INVALID:
> +               return "Command-invalid/Cmd-locked";
> +       case IPC_DEV_ERR_CMD_FAILED:
> +               return "Command-failed/Invalid-VR-id";
> +       case IPC_DEV_ERR_EMSECURITY:
> +               return "Invalid Battery/VR-Error";
> +       case IPC_DEV_ERR_UNSIGNEDKERNEL:
> +               return "Unsigned kernel";
> +       default:
> +               return "Unknown Command";
> +       };
> +}

Since it's continuous list you can define an array of messages like

const char * const *errors = {
 [..._ERR_...] = "",
 ...

};

Also you can use enum in the header and define _ERR_MAX there.
Thus, code would be transformed to

if (error < _ERR_MAX)
 return errors[error];

return "Unknown Command";

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
