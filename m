Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32107C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 09:37:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12FB961222
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 09:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbhDMJh4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Apr 2021 05:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56180 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229679AbhDMJhz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Apr 2021 05:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618306656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V9J8Vg5Wgq5sTuEmU+vgPHWPR2aG1l6hGsXA3Nfx6zE=;
        b=geS3XpKTlmockU2cDwqdDMVNN3ffJa0SCsLID/hVQ40BQVHKMSl27Rrfb/QRihXwZv1wQt
        dqDLgL3u9xrKeSGjAFLI18gaSGO656JHc22hER7n0mw9vrdbQbUPr+q8deiVaTpYud8Tx6
        wuQ0EBnBujZJugC+KfyzW0bBKPm68/A=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-5yDwlhocO5-fVtERyZ5Z3A-1; Tue, 13 Apr 2021 05:37:34 -0400
X-MC-Unique: 5yDwlhocO5-fVtERyZ5Z3A-1
Received: by mail-ej1-f70.google.com with SMTP id qx17so1959518ejb.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Apr 2021 02:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V9J8Vg5Wgq5sTuEmU+vgPHWPR2aG1l6hGsXA3Nfx6zE=;
        b=nBViKR4e+12N6oJh1Zef9z+yiaWytVFk5JTl2DHaTix7Toh9vavTxehuHQ6mX+xEMI
         MrnOA/QAuWByKZWMlGwsGC/Sb/uTZOvJWX7jZGeHDN3aDzMDhpmXQz8jc7JaIB1JncJJ
         WpXekBurFzJ0XBdXREb2o2WAOSQ8Z1deanYWO10Lrz7QMNkQav3IsRJGHEk0rsn/eLsN
         DMEKGIhsgL/533Ht8At8MLoZVNg8lsLexbIP3F4viJfsYhkR5G1ILoMabrCQiLsx2Se0
         7st6n6Ed71FQWNHQ2dsjdXYjSnrZTwpg8BH59lWSkcwgxtqyWulh9nMYh2KR5ibzKOWL
         DosQ==
X-Gm-Message-State: AOAM532cv3YZB2r8fC08cijMQAO+oQwA1ZFAW0yQwwjTv9dHIaDxxslD
        WNy0/UhAMveeyaCCW9RhBF+Z54O6TqzzdNCXCeJuoM2ObxVdCaazTAu8TIuE/4iA8sg9t209dHm
        MUHVTLyMODsfdtUqIY1yj3YvZVGuQW1DErSAfqNtsxASPT/XVAFZqSabsJxIeBHzla5avj9piVj
        uI+tPi2Z/Ltg==
X-Received: by 2002:a50:9b18:: with SMTP id o24mr33850423edi.227.1618306653072;
        Tue, 13 Apr 2021 02:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF+rxSYg8tlwHoauuPZc+4RTo3Cx85bV+A30mxP75+tvDKkj0fyuUA60GBv9kbQV7P19RCvw==
X-Received: by 2002:a50:9b18:: with SMTP id o24mr33850396edi.227.1618306652836;
        Tue, 13 Apr 2021 02:37:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id i2sm9032111edy.72.2021.04.13.02.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 02:37:32 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add labels to the first 2
 temperature sensors
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20210413072112.183550-1-hdegoede@redhat.com>
 <CAHp75VeLrNN3bwERwp3oZg7pRJXMi0y8vAbw97NKoEmm33AfgQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2e1f570d-841d-da36-ba07-1d74249aef3b@redhat.com>
Date:   Tue, 13 Apr 2021 11:37:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeLrNN3bwERwp3oZg7pRJXMi0y8vAbw97NKoEmm33AfgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/13/21 11:06 AM, Andy Shevchenko wrote:
> 
> 
> On Tuesday, April 13, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     On EC version 3, the first 2 temperature sensors are always CPU and GPU
>     add labels for these.
> 
>     This changes e.g. the "sensors" command output on a X1C8 from:
> 
>     thinkpad-isa-0000
>     Adapter: ISA adapter
>     fan1:        2694 RPM
>     temp1:        +42.0°C
>     temp2:            N/A
>     temp3:        +33.0°C
>     temp4:         +0.0°C
>     temp5:        +35.0°C
>     temp6:        +42.0°C
>     temp7:        +42.0°C
>     temp8:            N/A
> 
>     into:
> 
>     thinkpad-isa-0000
>     Adapter: ISA adapter
>     fan1:        2694 RPM
>     CPU:          +42.0°C
>     GPU:              N/A
>     temp3:        +33.0°C
>     temp4:         +0.0°C
>     temp5:        +35.0°C
>     temp6:        +42.0°C
>     temp7:        +42.0°C
>     temp8:            N/A
> 
> 
> Is it an ABI change?

I don't think so, it adds 2 new sysfs files, all existing files keep working as is.

The _label attributes are part of the standard hwmon API and any tools
implementing that API will either ignore them (if they are ancient) or
use them to set a better default label then "temp1" and "temp2", while
still honoring any labels from config files with a higher priority then
the kernel provided ones.

> Any updates to the documentation? 
> 
> If the answer is yes, I would rather do one of the following approach: 
> 1) enable labels by user request (sysfs knob)
> 2) just add additional two lines
> 3) add an additional column for labels (or completely another file)
> 
> I have understand that there are cons of each of them. I dunno which one is the best. 

The answer is no :) So no need to worry about this

Regards,

Hans



> 
>  
> 
>     Signed-off-by: Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>>
>     ---
>      drivers/platform/x86/thinkpad_acpi.c | 72 ++++++++++++++++++----------
>      1 file changed, 47 insertions(+), 25 deletions(-)
> 
>     diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>     index ec98089d98c9..dd60c9397d35 100644
>     --- a/drivers/platform/x86/thinkpad_acpi.c
>     +++ b/drivers/platform/x86/thinkpad_acpi.c
>     @@ -6296,6 +6296,8 @@ struct ibm_thermal_sensors_struct {
>      };
> 
>      static enum thermal_access_mode thermal_read_mode;
>     +static const struct attribute_group *thermal_attr_group;
>     +static bool thermal_use_labels;
> 
>      /* idx is zero-based */
>      static int thermal_get_sensor(int idx, s32 *value)
>     @@ -6478,6 +6480,28 @@ static const struct attribute_group thermal_temp_input8_group = {
>      #undef THERMAL_SENSOR_ATTR_TEMP
>      #undef THERMAL_ATTRS
> 
>     +static ssize_t temp1_label_show(struct device *dev, struct device_attribute *attr, char *buf)
>     +{
>     +       return sysfs_emit(buf, "CPU\n");
>     +}
>     +static DEVICE_ATTR_RO(temp1_label);
>     +
>     +static ssize_t temp2_label_show(struct device *dev, struct device_attribute *attr, char *buf)
>     +{
>     +       return sysfs_emit(buf, "GPU\n");
>     +}
>     +static DEVICE_ATTR_RO(temp2_label);
>     +
>     +static struct attribute *temp_label_attributes[] = {
>     +       &dev_attr_temp1_label.attr,
>     +       &dev_attr_temp2_label.attr,
>     +       NULL
>     +};
>     +
>     +static const struct attribute_group temp_label_attr_group = {
>     +       .attrs = temp_label_attributes,
>     +};
>     +
>      /* --------------------------------------------------------------------- */
> 
>      static int __init thermal_init(struct ibm_init_struct *iibm)
>     @@ -6533,12 +6557,14 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
>                                     thermal_read_mode = TPACPI_THERMAL_NONE;
>                             }
>                     } else {
>     -                       if (ver >= 3)
>     +                       if (ver >= 3) {
>                                     thermal_read_mode = TPACPI_THERMAL_TPEC_8;
>     -                       else
>     +                               thermal_use_labels = true;
>     +                       } else {
>                                     thermal_read_mode =
>                                             (ta2 != 0) ?
>                                             TPACPI_THERMAL_TPEC_16 : TPACPI_THERMAL_TPEC_8;
>     +                       }
>                     }
>             } else if (acpi_tmp7) {
>                     if (tpacpi_is_ibm() &&
>     @@ -6560,44 +6586,40 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
> 
>             switch (thermal_read_mode) {
>             case TPACPI_THERMAL_TPEC_16:
>     -               res = sysfs_create_group(&tpacpi_hwmon->kobj,
>     -                               &thermal_temp_input16_group);
>     -               if (res)
>     -                       return res;
>     +               thermal_attr_group = &thermal_temp_input16_group;
>                     break;
>             case TPACPI_THERMAL_TPEC_8:
>             case TPACPI_THERMAL_ACPI_TMP07:
>             case TPACPI_THERMAL_ACPI_UPDT:
>     -               res = sysfs_create_group(&tpacpi_hwmon->kobj,
>     -                               &thermal_temp_input8_group);
>     -               if (res)
>     -                       return res;
>     +               thermal_attr_group = &thermal_temp_input8_group;
>                     break;
>             case TPACPI_THERMAL_NONE:
>             default:
>                     return 1;
>             }
> 
>     +       res = sysfs_create_group(&tpacpi_hwmon->kobj, thermal_attr_group);
>     +       if (res)
>     +               return res;
>     +
>     +       if (thermal_use_labels) {
>     +               res = sysfs_create_group(&tpacpi_hwmon->kobj, &temp_label_attr_group);
>     +               if (res) {
>     +                       sysfs_remove_group(&tpacpi_hwmon->kobj, thermal_attr_group);
>     +                       return res;
>     +               }
>     +       }
>     +
>             return 0;
>      }
> 
>      static void thermal_exit(void)
>      {
>     -       switch (thermal_read_mode) {
>     -       case TPACPI_THERMAL_TPEC_16:
>     -               sysfs_remove_group(&tpacpi_hwmon->kobj,
>     -                                  &thermal_temp_input16_group);
>     -               break;
>     -       case TPACPI_THERMAL_TPEC_8:
>     -       case TPACPI_THERMAL_ACPI_TMP07:
>     -       case TPACPI_THERMAL_ACPI_UPDT:
>     -               sysfs_remove_group(&tpacpi_hwmon->kobj,
>     -                                  &thermal_temp_input8_group);
>     -               break;
>     -       case TPACPI_THERMAL_NONE:
>     -       default:
>     -               break;
>     -       }
>     +       if (thermal_attr_group)
>     +               sysfs_remove_group(&tpacpi_hwmon->kobj, thermal_attr_group);
>     +
>     +       if (thermal_use_labels)
>     +               sysfs_remove_group(&tpacpi_hwmon->kobj, &temp_label_attr_group);
>      }
> 
>      static int thermal_read(struct seq_file *m)
>     -- 
>     2.31.1
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

