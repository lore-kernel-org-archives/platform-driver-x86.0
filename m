From: "Limonciello, Mario" <Mario.Limonciello-8PEkshWhKlo@public.gmane.org>
Subject: Re: [External] RE: [PATCH] platform/x86:
 thinkpad_acpi: performance mode interface
Date: Thu, 23 Jul 2020 01:36:19 +0000
Message-ID: <DM6PR19MB2636F2A87EE2DF8BD2B9A879FA760@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200722171108.65185-1-markpearson@lenovo.com>
 <DM6PR19MB263650F7DC4B6680A5EFC5DAFA790@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b79e0359-536d-f496-a01e-fe4c4b7796cc@lenovo.com>
 <DM6PR19MB26360DE8FCA56BC132644F98FA790@DM6PR19MB2636.namprd19.prod.outlook.com>
 <e14aa227-493b-4206-eaef-81874512166f@lenovo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <e14aa227-493b-4206-eaef-81874512166f-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Cc: "bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, "bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

> >
> > Since it's not mentioned I can only guess your firmware implementation
> associated
> > with this code.  I would think for example that touching some PLx related
> MSR or
> > possibly RAPL interface might cause unexpected behaviors.
> >
> > Assuming that's right kernel lockdown might prevent some of the MSR, but
> if you really
> > want user fully in control of this decision by one knob, you shouldn't
> let common
> > userspace tools like thermald, tuned, tlp or the like touch the related
> objects.
> >
> Hmmm - I think I disagree here.
> 
> I don't think this should control what other userspace tools (like
> thermald) want to do with the CPU registers. Adding hooks into those
> other pieces of code also seems to me to be complicated and unnecessary
> in the kernel (and way beyond the scope of this patch). As an aside - my
> experience from testing is that thermald will override what the firmware
> is doing anyway.

I'm actually in agreement it is potentially quite complicated and shouldn't be in
this specific patch.  I was going to suggest it should either come as other
patches, or perhaps in documentation along the lines of "Users using this interface
should not use other tools to modify X, Y and Z".  No need to mention the actual
tools, but you should try to help prevent users shooting themselves in the foot
unintentionally.

> 
> I can see the value of adding a feature to *disable* the Lenovo firmware
> implementation as that doesn't currently exist. I will talk to the
> firmware team and see what can be done and take that on as a separate
> task. If there's a mechanism to do that already in a safe way then I'll
> add that to this.

This is actually even better to me.  Back to the H/M/L approach if you can have
an extra one for "off" then userspace tools that want to control the same levers
can turn this off when they are taking control.
